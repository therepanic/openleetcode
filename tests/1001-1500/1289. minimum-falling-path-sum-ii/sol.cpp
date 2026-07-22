class Solution {
public:
    int minFallingPathSum(vector<vector<int>>& grid) {
        int n = grid.size();
        vector<int> dp = grid[0];
        for (int i = 1; i < n; i++) {
            int smallest = INT_MAX;
            int second_smallest = INT_MAX;
            int smallest_col = -1;
            for (int col = 0; col < n; col++) {
                if (dp[col] < smallest) {
                    second_smallest = smallest;
                    smallest = dp[col];
                    smallest_col = col;
                } else if (dp[col] < second_smallest) {
                    second_smallest = dp[col];
                }
            }
            vector<int> new_dp(n);
            for (int col = 0; col < n; col++) {
                new_dp[col] = grid[i][col] + (col == smallest_col ? second_smallest : smallest);
            }
            dp = new_dp;
        }
        return *min_element(dp.begin(), dp.end());
    }
};
