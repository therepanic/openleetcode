class Solution {
public:
    vector<int> findRedundantConnection(vector<vector<int>>& edges) {
        int n = edges.size();
        vector<vector<int>> matrix(n + 1);
        for (auto& edge : edges) {
            int a = edge[0], b = edge[1];
            matrix[a].push_back(b);
            matrix[b].push_back(a);
        }

        unordered_set<int> visited;
        unordered_set<int> path;
        int cycleStart = -1;

        function<bool(int, int)> dfs = [&](int i, int parent) -> bool {
            if (visited.count(i)) return false;
            visited.insert(i);
            for (int node : matrix[i]) {
                if (!visited.count(node)) {
                    if (dfs(node, i)) {
                        if (cycleStart != -1) {
                            path.insert(node);
                        }
                        if (node == cycleStart) {
                            cycleStart = -1;
                        }
                        return true;
                    }
                } else if (node != parent) {
                    path.insert(node);
                    cycleStart = node;
                    return true;
                }
            }
            return false;
        };

        for (int i = n; i >= 1; i--) {
            if (dfs(i, -1)) break;
        }

        for (int k = n - 1; k >= 0; k--) {
            int a = edges[k][0], b = edges[k][1];
            if (path.count(a) && path.count(b)) {
                return {a, b};
            }
        }
        return {};
    }
};
