class Solution {
public:
    vector<int> sumOfDistancesInTree(int n, vector<vector<int>>& edges) {
        vector<vector<int>> adj(n);
        for (auto& e : edges) {
            int u = e[0], v = e[1];
            adj[u].push_back(v);
            adj[v].push_back(u);
        }
        
        vector<int> count(n, 1);
        vector<int> ans(n, 0);
        
        function<void(int, int)> dfsIn = [&](int node, int parent) {
            for (int child : adj[node]) {
                if (child != parent) {
                    dfsIn(child, node);
                    count[node] += count[child];
                    ans[node] += ans[child] + count[child];
                }
            }
        };
        
        function<void(int, int)> dfsOut = [&](int node, int parent) {
            for (int child : adj[node]) {
                if (child != parent) {
                    ans[child] = ans[node] - count[child] + (n - count[child]);
                    dfsOut(child, node);
                }
            }
        };
        
        dfsIn(0, -1);
        dfsOut(0, -1);
        return ans;
    }
};
