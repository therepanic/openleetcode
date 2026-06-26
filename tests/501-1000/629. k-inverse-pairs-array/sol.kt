class Solution {
    fun kInversePairs(n: Int, k: Int): Int {
        val MOD = 1000000007
        val dp = Array(n + 1) { IntArray(k + 1) }

        for (i in 1..n) {
            for (j in 0..k) {
                if (j == 0) {
                    dp[i][j] = 1
                } else {
                    var `val` = dp[i - 1][j].toLong()
                    if (j - i >= 0) {
                        `val` = (`val` - dp[i - 1][j - i] + MOD) % MOD
                    }
                    dp[i][j] = ((dp[i][j - 1] + `val`) % MOD).toInt()
                }
            }
        }

        var result = dp[n][k].toLong()
        if (k > 0) {
            result = (result - dp[n][k - 1] + MOD) % MOD
        }
        return result.toInt()
    }
}
