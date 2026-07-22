class Solution {
    fun numWays(steps: Int, arrLen: Int): Int {
        val MOD = 1000000007
        val maxPos = minOf(steps / 2, arrLen - 1)
        var dp = IntArray(maxPos + 1)
        dp[0] = 1
        repeat(steps) {
            val newDp = IntArray(maxPos + 1)
            for (pos in 0..maxPos) {
                if (dp[pos] == 0) continue
                newDp[pos] = (newDp[pos] + dp[pos]) % MOD
                if (pos > 0) newDp[pos - 1] = (newDp[pos - 1] + dp[pos]) % MOD
                if (pos < maxPos) newDp[pos + 1] = (newDp[pos + 1] + dp[pos]) % MOD
            }
            dp = newDp
        }
        return dp[0]
    }
}
