class Solution {
public:
    vector<int> countSubTrees(int n, vector<vector<int>>& edges, string labels) {
        vector<vector<int>> matrix(n);
        for (auto& edge : edges) {
            int u = edge[0], v = edge[1];
            matrix[u].push_back(v);
            matrix[v].push_back(u);
        }

        vector<int> parent(n, -1);
        vector<int> order = {0};
        for (int i = 0; i < order.size(); i++) {
            int node = order[i];
            for (int child : matrix[node]) {
                if (child != parent[node]) {
                    parent[child] = node;
                    order.push_back(child);
                }
            }
        }

        vector<vector<int>> counts(n, vector<int>(26, 0));
        vector<int> ans(n);
        for (int i = n - 1; i >= 0; i--) {
            int node = order[i];
            int label = labels[node] - 'a';
            counts[node][label]++;
            ans[node] = counts[node][label];
            if (parent[node] != -1) {
                for (int j = 0; j < 26; j++) {
                    counts[parent[node]][j] += counts[node][j];
                }
            }
        }
        return ans;
    }
};
