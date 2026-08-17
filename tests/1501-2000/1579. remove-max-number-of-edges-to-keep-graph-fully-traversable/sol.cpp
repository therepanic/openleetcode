class Solution {
public:
    int maxNumEdgesToRemove(int n, vector<vector<int>>& edges) {
        sort(edges.begin(), edges.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[0] > b[0];
        });
        vector<int> parentA(n + 1), parentB(n + 1);
        vector<int> rankA(n + 1, 0), rankB(n + 1, 0);
        iota(parentA.begin(), parentA.end(), 0);
        iota(parentB.begin(), parentB.end(), 0);

        function<int(vector<int>&, int)> find = [&](vector<int>& parent, int x) {
            if (parent[x] != x) parent[x] = find(parent, parent[x]);
            return parent[x];
        };

        auto unionSet = [&](vector<int>& parent, vector<int>& rank, int x, int y) {
            int rootX = find(parent, x);
            int rootY = find(parent, y);
            if (rootX == rootY) return false;
            if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY;
            } else if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX;
            } else {
                parent[rootX] = rootY;
                rank[rootY]++;
            }
            return true;
        };

        int removed = 0;
        int aliceEdges = 0, bobEdges = 0;
        for (auto& e : edges) {
            if (e[0] == 3) {
                if (unionSet(parentA, rankA, e[1], e[2])) {
                    unionSet(parentB, rankB, e[1], e[2]);
                    aliceEdges++;
                    bobEdges++;
                } else {
                    removed++;
                }
            } else if (e[0] == 2) {
                if (unionSet(parentB, rankB, e[1], e[2])) {
                    bobEdges++;
                } else {
                    removed++;
                }
            } else {
                if (unionSet(parentA, rankA, e[1], e[2])) {
                    aliceEdges++;
                } else {
                    removed++;
                }
            }
        }
        return (bobEdges == n - 1 && aliceEdges == n - 1) ? removed : -1;
    }
};
