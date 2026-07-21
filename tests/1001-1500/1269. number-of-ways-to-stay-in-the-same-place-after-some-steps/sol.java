class Solution {
    public int numWays(int steps, int arrLen) {
        final int MOD = 1000000007;
        int maxPos = Math.min(steps / 2, arrLen - 1);
        int[] dp = new int[maxPos + 1];
        dp[0] = 1;
        for (int step = 0; step < steps; step++) {
            int[] newDp = new int[maxPos + 1];
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
}
