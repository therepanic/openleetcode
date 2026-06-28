class Solution {
    fun minimumDeleteSum(s1: String, s2: String): Int {
        val n = s1.length
        val m = s2.length
        val dp = Array(n + 1) { IntArray(m + 1) }
        for (i in 0 until n) {
            for (j in 0 until m) {
                if (s1[i] == s2[j]) {
                    dp[i + 1][j + 1] = dp[i][j] + s1[i].code
                } else {
                    dp[i + 1][j + 1] = maxOf(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }
        val totalAscii = s1.sumOf { it.code } + s2.sumOf { it.code }
        return totalAscii - 2 * dp[n][m]
    }
}
