import 'dart:collection';

class Solution {
  int longestCommonSubpath(int n, List<List<int>> paths) {
    List<int> combined = [];
    List<int> pathOrigin = [];
    for (int i = 0; i < paths.length; i++) {
      for (int v in paths[i]) {
        combined.add(v);
        pathOrigin.add(i);
      }
      combined.add(-(i+1));
      pathOrigin.add(i);
    }
    int N = combined.length;
    int M = paths.length;
    List<int> S = combined;
    List<int> P = pathOrigin;

    // rank compression
    List<int> rank = List.filled(N, 0);
    {
      List<int> temp = List.from(S)..sort();
      for (int i = 0; i < N; i++) {
        rank[i] = temp.indexOf(S[i]);
      }
    }

    int k = 1;
    while (k < N) {
      List<int> keys = List.filled(N, 0);
      for (int i = 0; i < N; i++) {
        int first = rank[i];
        int second = (i+k < N) ? rank[i+k] + 1 : 0;
        // combine into single int (fits in 64-bit, but Dart int is 64-bit)
        keys[i] = (first << 32) | second;
      }
      List<int> sorted = List.from(keys)..sort();
      for (int i = 0; i < N; i++) {
        rank[i] = sorted.indexOf(keys[i]);
      }
      if (k >= N) break;
      k *= 2;
    }

    List<int> sa = List.filled(N, 0);
    for (int i = 0; i < N; i++) {
      sa[rank[i]] = i;
    }

    List<int> lcp = List.filled(N, 0);
    List<int> inv = List.from(rank);
    int h = 0;
    for (int i = 0; i < N; i++) {
      if (inv[i] > 0) {
        int j = sa[inv[i]-1];
        while (i+h < N && j+h < N && S[i+h] == S[j+h]) {
          h++;
        }
        lcp[inv[i]] = h;
        if (h > 0) h--;
      }
    }

    int ans = 0;
    int left = 0;
    List<int> count = List.filled(M, 0);
    int distinct = 0;
    Queue<int> minQ = Queue();
    for (int right = 0; right < N; right++) {
      int p = P[sa[right]];
      if (p >= 0) {
        if (count[p] == 0) distinct++;
        count[p]++;
      }
      while (minQ.isNotEmpty && lcp[minQ.last] >= lcp[right]) {
        minQ.removeLast();
      }
      minQ.addLast(right);

      while (distinct == M) {
        while (minQ.isNotEmpty && minQ.first <= left) {
          minQ.removeFirst();
        }
        if (minQ.isNotEmpty) {
          ans = ans > lcp[minQ.first] ? ans : lcp[minQ.first];
        }
        int out = P[sa[left]];
        if (out >= 0) {
          count[out]--;
          if (count[out] == 0) distinct--;
        }
        left++;
      }
    }
    return ans;
  }
}
