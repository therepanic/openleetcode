class Solution {
public:
    int mergeStones(vector<int>& stones, int k) {
        int n = stones.size();
        if ((n - 1) % (k - 1) != 0) return -1;
        
        vector<int> prefix(n + 1, 0);
        for (int i = 1; i <= n; i++) {
            prefix[i] = prefix[i-1] + stones[i-1];
        }
        
        vector<vector<vector<int>>> dp(n, vector<vector<int>>(n, vector<int>(k + 1, INT_MAX)));
        
        for (int i = 0; i < n; i++) {
            dp[i][i][1] = 0;
        }
        
        for (int len = 2; len <= n; len++) {
            for (int i = 0; i + len - 1 < n; i++) {
                int j = i + len - 1;
                for (int p = 2; p <= k; p++) {
                    for (int m = i; m < j; m += k - 1) {
                        if (dp[i][m][1] != INT_MAX && dp[m+1][j][p-1] != INT_MAX) {
                            dp[i][j][p] = min(dp[i][j][p], dp[i][m][1] + dp[m+1][j][p-1]);
                        }
                    }
                }
                if (dp[i][j][k] != INT_MAX) {
                    dp[i][j][1] = dp[i][j][k] + (prefix[j+1] - prefix[i]);
                }
            }
        }
        
        return dp[0][n-1][1] == INT_MAX ? -1 : dp[0][n-1][1];
    }
};
