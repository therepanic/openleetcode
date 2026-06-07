class Solution {
public:
    int minPathSum(vector<vector<int>>& grid) {
        int rows = grid.size();
        int cols = grid[0].size();
        vector<int> dp(cols, 0);
        dp[0] = grid[0][0];

        for (int col = 1; col < cols; ++col) {
            dp[col] = dp[col - 1] + grid[0][col];
        }

        for (int row = 1; row < rows; ++row) {
            dp[0] += grid[row][0];
            for (int col = 1; col < cols; ++col) {
                dp[col] = min(dp[col], dp[col - 1]) + grid[row][col];
            }
        }

        return dp[cols - 1];
    }
};
