class Solution {
private:
    int n, m;
    vector<vector<bool>> visited;
    vector<vector<int>> directions = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
    
    int dfs(vector<vector<int>>& grid, int r, int c) {
        int total = grid[r][c];
        visited[r][c] = true;
        
        int curr = 0;
        for (auto& dir : directions) {
            int nr = r + dir[0];
            int nc = c + dir[1];
            if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                if (grid[nr][nc] != 0 && !visited[nr][nc]) {
                    int a = dfs(grid, nr, nc);
                    curr = max(curr, a);
                }
            }
        }
        total += curr;
        visited[r][c] = false;
        return total;
    }
    
public:
    int getMaximumGold(vector<vector<int>>& grid) {
        n = grid.size();
        m = grid[0].size();
        visited = vector<vector<bool>>(n, vector<bool>(m, false));
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j] && grid[i][j] != 0) {
                    ans = max(ans, dfs(grid, i, j));
                }
            }
        }
        return ans;
    }
};
