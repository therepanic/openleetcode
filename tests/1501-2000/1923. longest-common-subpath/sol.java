import java.util.*;

class Solution {
    public int longestCommonSubpath(int n, int[][] paths) {
        List<Integer> combined = new ArrayList<>();
        List<Integer> pathOrigin = new ArrayList<>();
        for (int i = 0; i < paths.length; i++) {
            for (int v : paths[i]) {
                combined.add(v);
                pathOrigin.add(i);
            }
            combined.add(-(i+1));
            pathOrigin.add(i);
        }
        int N = combined.size();
        int M = paths.length;
        int[] S = new int[N];
        int[] P = new int[N];
        for (int i = 0; i < N; i++) {
            S[i] = combined.get(i);
            P[i] = pathOrigin.get(i);
        }

        // rank compression
        int[] rank = new int[N];
        {
            int[] temp = S.clone();
            Arrays.sort(temp);
            for (int i = 0; i < N; i++) {
                rank[i] = Arrays.binarySearch(temp, S[i]);
            }
        }

        int k = 1;
        while (k < N) {
            long[] keys = new long[N];
            for (int i = 0; i < N; i++) {
                long first = rank[i];
                long second = (i+k < N) ? rank[i+k] + 1L : 0L;
                keys[i] = (first << 32) | second;
            }
            long[] sorted = keys.clone();
            Arrays.sort(sorted);
            for (int i = 0; i < N; i++) {
                rank[i] = Arrays.binarySearch(sorted, keys[i]);
            }
            if (k >= N) break;
            k *= 2;
        }

        int[] sa = new int[N];
        for (int i = 0; i < N; i++) {
            sa[rank[i]] = i;
        }

        int[] lcp = new int[N];
        int[] inv = rank.clone();
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
        int[] count = new int[M];
        int distinct = 0;
        Deque<Integer> minQ = new ArrayDeque<>();
        for (int right = 0; right < N; right++) {
            int p = P[sa[right]];
            if (p >= 0) {
                if (count[p] == 0) distinct++;
                count[p]++;
            }
            while (!minQ.isEmpty() && lcp[minQ.peekLast()] >= lcp[right]) {
                minQ.pollLast();
            }
            minQ.offerLast(right);

            while (distinct == M) {
                while (!minQ.isEmpty() && minQ.peekFirst() <= left) {
                    minQ.pollFirst();
                }
                if (!minQ.isEmpty()) {
                    ans = Math.max(ans, lcp[minQ.peekFirst()]);
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
