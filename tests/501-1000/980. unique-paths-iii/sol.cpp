class Solution {
public:
    int uniquePathsIII(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size();
        int sx = -1, sy = -1;
        int count = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 0) count++;
                if (grid[i][j] == 1) {
                    sx = i;
                    sy = j;
                }
            }
        }
        return backtrack(grid, m, n, sx, sy, count);
    }
    
    int backtrack(vector<vector<int>>& grid, int m, int n, int i, int j, int count) {
        int result = 0;
        vector<pair<int,int>> dirs = {{i-1, j}, {i+1, j}, {i, j-1}, {i, j+1}};
        for (auto [x, y] : dirs) {
            if (x < 0 || x >= m || y < 0 || y >= n) continue;
            if (grid[x][y] == 2) {
                if (count == 0) result++;
            } else if (grid[x][y] == 0) {
                grid[x][y] = -1;
                result += backtrack(grid, m, n, x, y, count - 1);
                grid[x][y] = 0;
            }
        }
        return result;
    }
};
