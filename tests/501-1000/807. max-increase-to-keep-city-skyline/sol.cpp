class Solution {
public:
    int maxIncreaseKeepingSkyline(vector<vector<int>>& grid) {
        int n = grid.size();
        vector<int> rowMax(n, 0), colMax(n, 0);
        for (int r = 0; r < n; r++) {
            rowMax[r] = *max_element(grid[r].begin(), grid[r].end());
        }
        for (int c = 0; c < n; c++) {
            int maxVal = 0;
            for (int r = 0; r < n; r++) {
                maxVal = max(maxVal, grid[r][c]);
            }
            colMax[c] = maxVal;
        }
        int gain = 0;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                gain += min(rowMax[r], colMax[c]) - grid[r][c];
            }
        }
        return gain;
    }
};
