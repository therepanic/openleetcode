class Solution {
    public int makeConnected(int n, int[][] connections) {
        if (connections.length < n - 1) {
            return -1;
        }

        int[] parent = new int[n];
        int[] size = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
            size[i] = 1;
        }

        int extra = 0;
        for (int[] conn : connections) {
            int u = conn[0];
            int v = conn[1];
            if (find(parent, u) == find(parent, v)) {
                extra++;
            } else {
                union(parent, size, u, v);
            }
        }

        int components = 0;
        for (int i = 0; i < n; i++) {
            if (find(parent, i) == i) {
                components++;
            }
        }

        return extra >= components - 1 ? components - 1 : -1;
    }

    private int find(int[] parent, int node) {
        if (parent[node] != node) {
            parent[node] = find(parent, parent[node]);
        }
        return parent[node];
    }

    private void union(int[] parent, int[] size, int u, int v) {
        int pu = find(parent, u);
        int pv = find(parent, v);
        if (pu == pv) return;
        if (size[pu] < size[pv]) {
            parent[pu] = pv;
            size[pv] += size[pu];
        } else {
            parent[pv] = pu;
            size[pu] += size[pv];
        }
    }
}
