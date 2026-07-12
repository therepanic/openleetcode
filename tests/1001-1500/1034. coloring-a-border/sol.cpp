class Solution {
public:
    vector<vector<int>> colorBorder(vector<vector<int>>& grid, int row, int col, int color) {
        int rows = grid.size();
        int cols = grid[0].size();
        int startColor = grid[row][col];
        
        if (startColor == color) {
            return grid;
        }
        
        queue<pair<int, int>> q;
        q.push({row, col});
        vector<vector<bool>> visited(rows, vector<bool>(cols, false));
        visited[row][col] = true;
        vector<pair<int, int>> borders;
        
        vector<pair<int, int>> dirs = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        
        while (!q.empty()) {
            auto [r, c] = q.front();
            q.pop();
            bool isBorder = false;
            
            for (auto [dr, dc] : dirs) {
                int nr = r + dr;
                int nc = c + dc;
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) {
                    isBorder = true;
                } else if (grid[nr][nc] != startColor) {
                    isBorder = true;
                } else if (!visited[nr][nc]) {
                    visited[nr][nc] = true;
                    q.push({nr, nc});
                }
            }
            
            if (isBorder) {
                borders.push_back({r, c});
            }
        }
        
        for (auto [r, c] : borders) {
            grid[r][c] = color;
        }
        
        return grid;
    }
};
