class Solution {
public:
    int makeConnected(int n, vector<vector<int>>& connections) {
        if (connections.size() < n - 1) {
            return -1;
        }

        vector<int> parent(n);
        vector<int> size(n, 1);
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }

        function<int(int)> find = [&](int node) {
            if (parent[node] != node) {
                parent[node] = find(parent[node]);
            }
            return parent[node];
        };

        auto unionSets = [&](int u, int v) {
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
        };

        int extra = 0;
        for (auto& conn : connections) {
            int u = conn[0];
            int v = conn[1];
            if (find(u) == find(v)) {
                extra++;
            } else {
                unionSets(u, v);
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
};
