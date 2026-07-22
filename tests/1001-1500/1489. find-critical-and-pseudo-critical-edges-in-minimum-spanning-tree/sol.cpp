class Solution {
private:
    class UnionFind {
    public:
        vector<int> parent;
        UnionFind(int n) {
            parent.resize(n);
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        int findParent(int p) {
            if (parent[p] == p) return p;
            parent[p] = findParent(parent[p]);
            return parent[p];
        }
        void unionNodes(int u, int v) {
            int pu = findParent(u);
            int pv = findParent(v);
            parent[pu] = pv;
        }
    };

    int findMST(int n, vector<vector<int>>& edges, int block, int e) {
        UnionFind uf(n);
        int weight = 0;
        if (e != -1) {
            weight += edges[e][2];
            uf.unionNodes(edges[e][0], edges[e][1]);
        }
        for (int i = 0; i < edges.size(); i++) {
            if (i == block) continue;
            if (uf.findParent(edges[i][0]) == uf.findParent(edges[i][1])) continue;
            uf.unionNodes(edges[i][0], edges[i][1]);
            weight += edges[i][2];
        }
        for (int i = 0; i < n; i++) {
            if (uf.findParent(i) != uf.findParent(0)) return INT_MAX;
        }
        return weight;
    }

public:
    vector<vector<int>> findCriticalAndPseudoCriticalEdges(int n, vector<vector<int>>& edges) {
        vector<int> critical, pseudoCritical;
        int m = edges.size();
        vector<vector<int>> edgesWithIdx(m, vector<int>(4));
        for (int i = 0; i < m; i++) {
            edgesWithIdx[i][0] = edges[i][0];
            edgesWithIdx[i][1] = edges[i][1];
            edgesWithIdx[i][2] = edges[i][2];
            edgesWithIdx[i][3] = i;
        }
        sort(edgesWithIdx.begin(), edgesWithIdx.end(), [](vector<int>& a, vector<int>& b) {
            return a[2] < b[2];
        });
        int mstwt = findMST(n, edgesWithIdx, -1, -1);
        for (int i = 0; i < m; i++) {
            if (mstwt < findMST(n, edgesWithIdx, i, -1)) {
                critical.push_back(edgesWithIdx[i][3]);
            } else if (mstwt == findMST(n, edgesWithIdx, -1, i)) {
                pseudoCritical.push_back(edgesWithIdx[i][3]);
            }
        }
        return {critical, pseudoCritical};
    }
};
