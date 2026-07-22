class Solution {
public:
    int numWays(int steps, int arrLen) {
        const int MOD = 1000000007;
        int maxPos = min(steps / 2, arrLen - 1);
        vector<int> dp(maxPos + 1, 0);
        dp[0] = 1;
        for (int step = 0; step < steps; step++) {
            vector<int> newDp(maxPos + 1, 0);
            for (int pos = 0; pos <= maxPos; pos++) {
                if (dp[pos] == 0) continue;
                newDp[pos] = (newDp[pos] + dp[pos]) % MOD;
                if (pos > 0) newDp[pos - 1] = (newDp[pos - 1] + dp[pos]) % MOD;
                if (pos < maxPos) newDp[pos + 1] = (newDp[pos + 1] + dp[pos]) % MOD;
            }
            dp = newDp;
        }
        return dp[0];
    }
};
