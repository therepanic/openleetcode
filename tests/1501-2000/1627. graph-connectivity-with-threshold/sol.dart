class Solution {
  List<bool> areConnected(int n, int threshold, List<List<int>> queries) {
    int limit = n;
    for (var q in queries) {
      if (q[0] > limit) limit = q[0];
      if (q[1] > limit) limit = q[1];
    }
    List<int> parent = List.generate(limit + 1, (i) => i);
    List<int> rank = List.filled(limit + 1, 1);

    int find(int x) {
      int res = x;
      while (res != parent[res]) {
        parent[res] = parent[parent[res]];
        res = parent[res];
      }
      return res;
    }

    bool union(int a, int b) {
      int p1 = find(a);
      int p2 = find(b);
      if (p1 == p2) return false;
      if (rank[p1] > rank[p2]) {
        parent[p2] = p1;
        rank[p1] += rank[p2];
      } else {
        parent[p1] = p2;
        rank[p2] += rank[p1];
      }
      return true;
    }

    for (int i = threshold + 1; i <= limit; i++) {
      for (int j = 2 * i; j <= limit; j += i) {
        union(i, j);
      }
    }

    return queries.map((q) => find(q[0]) == find(q[1])).toList();
  }
}
