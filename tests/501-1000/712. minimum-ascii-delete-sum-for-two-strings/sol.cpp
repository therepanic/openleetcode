class Solution {
public:
    int minimumDeleteSum(string s1, string s2) {
        int n = s1.size(), m = s2.size();
        vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (s1[i] == s2[j]) {
                    dp[i + 1][j + 1] = dp[i][j] + (int)s1[i];
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j]);
                }
            }
        }
        int totalAscii = 0;
        for (char c : s1) totalAscii += (int)c;
        for (char c : s2) totalAscii += (int)c;
        return totalAscii - 2 * dp[n][m];
    }
};
