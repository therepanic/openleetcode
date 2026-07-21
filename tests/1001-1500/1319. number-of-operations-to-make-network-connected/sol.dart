class Solution {
  int makeConnected(int n, List<List<int>> connections) {
    if (connections.length < n - 1) {
      return -1;
    }

    List<int> parent = List.generate(n, (i) => i);
    List<int> size = List.filled(n, 1);

    int find(int node) {
      if (parent[node] != node) {
        parent[node] = find(parent[node]);
      }
      return parent[node];
    }

    void union(int u, int v) {
      int pu = find(u);
      int pv = find(v);
      if (pu == pv) return;
      if (size[pu] < size[pv]) {
        parent[pu] = pv;
        size[pv] += size[pu];
      } else {
        parent[pv] = pu;
        size[pu] += size[pv];
      }
    }

    int extra = 0;
    for (var conn in connections) {
      int u = conn[0];
      int v = conn[1];
      if (find(u) == find(v)) {
        extra++;
      } else {
        union(u, v);
      }
    }

    int components = 0;
    for (int i = 0; i < n; i++) {
      if (find(i) == i) {
        components++;
      }
    }

    return extra >= components - 1 ? components - 1 : -1;
  }
}
