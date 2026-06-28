class Solution {
public:
    int kInversePairs(int n, int k) {
        const int MOD = 1000000007;
        vector<vector<long long>> dp(n + 1, vector<long long>(k + 1, 0));

        for (int i = 1; i <= n; i++) {
            for (int j = 0; j <= k; j++) {
                if (j == 0) {
                    dp[i][j] = 1;
                } else {
                    long long val = dp[i - 1][j];
                    if (j - i >= 0) {
                        val = (val - dp[i - 1][j - i] + MOD) % MOD;
                    }
                    dp[i][j] = (dp[i][j - 1] + val) % MOD;
                }
            }
        }

        long long result = dp[n][k];
        if (k > 0) {
            result = (result - dp[n][k - 1] + MOD) % MOD;
        }
        return (int)result;
    }
};
