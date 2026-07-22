class Solution {
public:
    int palindromePartition(string s, int k) {
        int n = s.size();
        vector<vector<int>> c(n, vector<int>(n, 0));
        for (int l = 2; l <= n; l++) {
            for (int i = 0; i <= n - l; i++) {
                int j = i + l - 1;
                c[i][j] = (l > 2 ? c[i + 1][j - 1] : 0) + (s[i] != s[j] ? 1 : 0);
            }
        }
        vector<vector<int>> dp(k + 1, vector<int>(n + 1, 1e9));
        dp[0][0] = 0;
        for (int i = 1; i <= n; i++) {
            dp[1][i] = c[0][i - 1];
        }
        for (int p = 2; p <= k; p++) {
            for (int i = p; i <= n; i++) {
                int mn = 1e9;
                for (int t = p - 1; t < i; t++) {
                    mn = min(mn, dp[p - 1][t] + c[t][i - 1]);
                }
                dp[p][i] = mn;
            }
        }
        return dp[k][n];
    }
};
