class Solution {
public:
    int minSteps(int n) {
        if (n == 1) return 0;
        vector<int> dp(n + 1);
        for (int i = 2; i <= n; i++) {
            dp[i] = i;
            for (int j = i - 1; j >= 1; j--) {
                if (i % j == 0) {
                    dp[i] = dp[j] + (i / j);
                    break;
                }
            }
        }
        return dp[n];
    }
};
