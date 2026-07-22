class Solution {
public:
    int minReorder(int n, vector<vector<int>>& connections) {
        unordered_set<string> roads;
        vector<vector<int>> graph(n);
        for (auto& conn : connections) {
            int x = conn[0], y = conn[1];
            graph[x].push_back(y);
            graph[y].push_back(x);
            roads.insert(to_string(x) + "," + to_string(y));
        }
        
        vector<bool> seen(n, false);
        seen[0] = true;
        
        function<int(int)> dfs = [&](int node) -> int {
            int ans = 0;
            for (int neighbor : graph[node]) {
                if (!seen[neighbor]) {
                    if (roads.count(to_string(node) + "," + to_string(neighbor))) {
                        ans++;
                    }
                    seen[neighbor] = true;
                    ans += dfs(neighbor);
                }
            }
            return ans;
        };
        
        return dfs(0);
    }
};
