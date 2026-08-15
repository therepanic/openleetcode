class Solution {
public:
    int numberOfCombinations(string num) {
        int n = num.size();
        const int MOD = 1000000007;
        vector<vector<long long>> dp(n, vector<long long>(n + 1, 0));
        for (int i = 0; i < n; ++i) {
            if (num[i] != '0') {
                for (int j = i + 1; j <= n; ++j) {
                    if (i == 0) {
                        dp[i][j] = 1;
                    } else {
                        int length = j - i;
                        dp[i][j] = dp[i][j - 1];
                        if (i - length >= 0 && num.substr(i - length, length) <= num.substr(i, length)) {
                            dp[i][j] += dp[i - length][i];
                        }
                        if (i - length + 1 >= 0 && num.substr(i - length + 1, length - 1) > num.substr(i, length - 1)) {
                            dp[i][j] += dp[i - length + 1][i];
                        }
                        dp[i][j] %= MOD;
                    }
                }
            }
        }
        long long ans = 0;
        for (int i = 0; i < n; ++i) {
            ans = (ans + dp[i][n]) % MOD;
        }
        return (int)ans;
    }
};
