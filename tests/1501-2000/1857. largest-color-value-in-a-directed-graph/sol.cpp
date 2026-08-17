class Solution {
public:
    int largestPathValue(string colors, vector<vector<int>>& edges) {
        const int INF = INT_MAX;
        int n = colors.size();
        vector<vector<int>> adj(n);
        for (auto& e : edges) {
            adj[e[0]].push_back(e[1]);
        }
        
        vector<vector<int>> count(n, vector<int>(26, 0));
        vector<int> vis(n, 0);
        
        function<int(int)> dfs = [&](int node) -> int {
            if (vis[node] == 1) return INF;
            if (vis[node] == 2) return count[node][colors[node] - 'a'];
            
            vis[node] = 1;
            for (int nxt : adj[node]) {
                int res = dfs(nxt);
                if (res == INF) return INF;
                for (int c = 0; c < 26; c++) {
                    count[node][c] = max(count[node][c], count[nxt][c]);
                }
            }
            
            int col = colors[node] - 'a';
            count[node][col]++;
            vis[node] = 2;
            return count[node][col];
        };
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            int val = dfs(i);
            if (val == INF) return -1;
            ans = max(ans, val);
        }
        
        return ans;
    }
};
