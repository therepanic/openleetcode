class Solution {
public:
    int maxDistance(vector<vector<int>>& grid) {
        if (grid.empty() || grid[0].empty()) {
            return -1;
        }
        
        int n = grid.size();
        queue<pair<int, int>> frontier;
        
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                if (grid[r][c] == 1) {
                    frontier.push({r, c});
                }
            }
        }
        
        if (frontier.empty() || frontier.size() == n * n) {
            return -1;
        }
        
        vector<pair<int, int>> directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        int distance = -1;
        
        while (!frontier.empty()) {
            int size = frontier.size();
            distance++;
            
            for (int i = 0; i < size; i++) {
                auto [r, c] = frontier.front();
                frontier.pop();
                
                for (auto [dr, dc] : directions) {
                    int nr = r + dr;
                    int nc = c + dc;
                    
                    if (nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0) {
                        grid[nr][nc] = 1;
                        frontier.push({nr, nc});
                    }
                }
            }
        }
        
        return distance;
    }
};
