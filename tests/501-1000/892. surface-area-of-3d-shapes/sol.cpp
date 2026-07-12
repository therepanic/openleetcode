class Solution {
public:
    int surfaceArea(vector<vector<int>>& grid) {
        int n = grid.size();
        int area = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] > 0) {
                    area += grid[i][j] * 6;
                    area -= (grid[i][j] - 1) * 2;
                    if (i + 1 < n) {
                        area -= 2 * min(grid[i][j], grid[i + 1][j]);
                    }
                    if (j + 1 < n) {
                        area -= 2 * min(grid[i][j], grid[i][j + 1]);
                    }
                }
            }
        }
        return area;
    }
};
