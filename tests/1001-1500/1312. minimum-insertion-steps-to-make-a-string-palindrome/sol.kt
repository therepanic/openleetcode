class Solution {
    fun minInsertions(s: String): Int {
        val n = s.length
        val s2 = s.reversed()
        val dp = Array(n + 1) { IntArray(n + 1) }
        for (i in 1..n) {
            for (j in 1..n) {
                if (s[i - 1] == s2[j - 1]) {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = maxOf(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return n - dp[n][n]
    }
}
