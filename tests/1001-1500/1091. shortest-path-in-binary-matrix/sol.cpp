class Solution {
public:
    int shortestPathBinaryMatrix(vector<vector<int>>& grid) {
        int n = grid.size();
        
        if (grid[0][0] == 1 || grid[n - 1][n - 1] == 1) {
            return -1;
        }
        
        if (n == 1) {
            return 1;
        }
        
        vector<vector<int>> dist(n, vector<int>(n, INT_MAX));
        dist[0][0] = 1;
        
        queue<vector<int>> q;
        q.push({0, 0, 1});
        
        vector<vector<int>> directions = {
            {-1, 0}, {-1, -1}, {0, 1}, {-1, 1},
            {1, 0}, {1, -1}, {0, -1}, {1, 1}
        };
        
        while (!q.empty()) {
            auto curr = q.front();
            q.pop();
            int r = curr[0], c = curr[1], dis = curr[2];
            
            for (auto& dir : directions) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                
                if (nr >= 0 && nr < n && nc >= 0 && nc < n &&
                    grid[nr][nc] == 0 && dis + 1 < dist[nr][nc]) {
                    
                    dist[nr][nc] = dis + 1;
                    
                    if (nr == n - 1 && nc == n - 1) {
                        return dis + 1;
                    }
                    
                    q.push({nr, nc, dis + 1});
                }
            }
        }
        
        return -1;
    }
};
