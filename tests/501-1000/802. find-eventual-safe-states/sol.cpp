class Solution {
public:
    vector<int> eventualSafeNodes(vector<vector<int>>& graph) {
        int n = graph.size();
        vector<int> state(n, 0); // 0: unvisited, 1: visiting, 2: safe
        vector<int> safe;
        
        function<bool(int)> dfs = [&](int node) -> bool {
            if (state[node] > 0) {
                return state[node] == 2;
            }
            
            state[node] = 1;
            
            for (int neighbor : graph[node]) {
                if (state[neighbor] == 1 || !dfs(neighbor)) {
                    return false;
                }
            }
            
            state[node] = 2;
            return true;
        };
        
        for (int i = 0; i < n; i++) {
            if (dfs(i)) {
                safe.push_back(i);
            }
        }
        
        return safe;
    }
};
