class Solution {
    fun longestPalindromeSubseq(s: String): Int {
        val n = s.length
        val dp = Array(n) { IntArray(n) }
        for (i in n - 1 downTo 0) {
            dp[i][i] = 1
            for (j in i + 1 until n) {
                if (s[i] == s[j]) {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    dp[i][j] = maxOf(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[0][n - 1]
    }
}
