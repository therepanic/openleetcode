public class Solution {
    public int MakeConnected(int n, int[][] connections) {
        if (connections.Length < n - 1) {
            return -1;
        }

        int[] parent = new int[n];
        int[] size = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
            size[i] = 1;
        }

        int Find(int node) {
            if (parent[node] != node) {
                parent[node] = Find(parent[node]);
            }
            return parent[node];
        }

        void Union(int u, int v) {
            int pu = Find(u);
            int pv = Find(v);
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
        foreach (var conn in connections) {
            int u = conn[0];
            int v = conn[1];
            if (Find(u) == Find(v)) {
                extra++;
            } else {
                Union(u, v);
            }
        }

        int components = 0;
        for (int i = 0; i < n; i++) {
            if (Find(i) == i) {
                components++;
            }
        }

        return extra >= components - 1 ? components - 1 : -1;
    }
}
