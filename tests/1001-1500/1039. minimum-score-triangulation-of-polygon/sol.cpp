class Solution {
public:
    int minScoreTriangulation(vector<int>& values) {
        int n = values.size();
        vector<vector<int>> dp(n, vector<int>(n, 0));
        for (int i = n - 1; i >= 0; i--) {
            for (int j = i + 1; j < n; j++) {
                int minVal = INT_MAX;
                for (int k = i + 1; k < j; k++) {
                    int val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j];
                    if (val < minVal) {
                        minVal = val;
                    }
                }
                if (minVal != INT_MAX) {
                    dp[i][j] = minVal;
                }
            }
        }
        return dp[0][n - 1];
    }
};
