class Solution {
public:
    int islandPerimeter(vector<vector<int>>& grid) {
        int rows = grid.size();
        int cols = grid[0].size();
        set<pair<int,int>> visited;
        
        int startR = -1, startC = -1;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (grid[r][c] == 1) {
                    startR = r;
                    startC = c;
                    break;
                }
            }
            if (startR != -1) break;
        }
        
        queue<pair<int,int>> q;
        q.push({startR, startC});
        visited.insert({startR, startC});
        int perimeter = 0;
        
        vector<pair<int,int>> dirs = {{-1,0},{1,0},{0,-1},{0,1}};
        
        while (!q.empty()) {
            auto [r, c] = q.front();
            q.pop();
            
            for (auto& dir : dirs) {
                int nr = r + dir.first;
                int nc = c + dir.second;
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0) {
                    perimeter++;
                } else if (visited.find({nr, nc}) == visited.end()) {
                    visited.insert({nr, nc});
                    q.push({nr, nc});
                }
            }
        }
        
        return perimeter;
    }
};
