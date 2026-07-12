class Solution {
public:
    int shortestPathLength(vector<vector<int>>& graph) {
        int n = graph.size();
        if (n == 1) return 0;
        
        int FULL = (1 << n) - 1;
        vector<vector<bool>> visited(n, vector<bool>(1 << n, false));
        queue<tuple<int, int, int>> q;
        
        for (int i = 0; i < n; i++) {
            int mask = 1 << i;
            q.push({i, mask, 0});
            visited[i][mask] = true;
        }
        
        while (!q.empty()) {
            auto [node, mask, dist] = q.front();
            q.pop();
            
            if (mask == FULL) return dist;
            
            for (int nei : graph[node]) {
                int newMask = mask | (1 << nei);
                
                if (!visited[nei][newMask]) {
                    visited[nei][newMask] = true;
                    q.push({nei, newMask, dist + 1});
                }
            }
        }
        
        return -1;
    }
};
