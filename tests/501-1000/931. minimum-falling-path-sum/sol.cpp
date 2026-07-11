class Solution {
public:
    int minFallingPathSum(vector<vector<int>>& matrix) {
        int m = matrix.size();
        int n = matrix[0].size();
        vector<int> dp = matrix[0];
        for (int i = 1; i < m; i++) {
            vector<int> ndp(n, INT_MAX);
            for (int j = 0; j < n; j++) {
                int best = dp[j];
                if (j > 0) best = min(best, dp[j - 1]);
                if (j + 1 < n) best = min(best, dp[j + 1]);
                ndp[j] = matrix[i][j] + best;
            }
            dp.swap(ndp);
        }
        return *min_element(dp.begin(), dp.end());
    }
};
