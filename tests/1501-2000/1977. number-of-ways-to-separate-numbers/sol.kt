class Solution {
    fun numberOfCombinations(num: String): Int {
        val n = num.length
        val MOD = 1_000_000_007L
        val dp = Array(n) { LongArray(n + 1) }
        for (i in 0 until n) {
            if (num[i] != '0') {
                for (j in i + 1..n) {
                    if (i == 0) {
                        dp[i][j] = 1
                    } else {
                        val length = j - i
                        dp[i][j] = dp[i][j - 1]
                        if (i - length >= 0 && num.substring(i - length, i) <= num.substring(i, j)) {
                            dp[i][j] += dp[i - length][i]
                        }
                        if (i - length + 1 >= 0 && num.substring(i - length + 1, i) > num.substring(i, j - 1)) {
                            dp[i][j] += dp[i - length + 1][i]
                        }
                        dp[i][j] %= MOD
                    }
                }
            }
        }
        var ans = 0L
        for (i in 0 until n) {
            ans = (ans + dp[i][n]) % MOD
        }
        return ans.toInt()
    }
}
