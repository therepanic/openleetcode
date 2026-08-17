class Solution {
    fun getLengthOfOptimalCompression(s: String, k: Int): Int {
        val n = s.length
        val dp = Array(110) { IntArray(110) { 9999 } }
        dp[0][0] = 0

        for (i in 1..n) {
            for (j in 0..k) {
                var cnt = 0
                var del = 0
                for (l in i downTo 1) {
                    if (s[l - 1] == s[i - 1]) cnt++ else del++

                    if (j - del >= 0) {
                        val add = when {
                            cnt >= 100 -> 3
                            cnt >= 10 -> 2
                            cnt >= 2 -> 1
                            else -> 0
                        }
                        dp[i][j] = minOf(dp[i][j], dp[l - 1][j - del] + 1 + add)
                    }
                }

                if (j > 0) {
                    dp[i][j] = minOf(dp[i][j], dp[i - 1][j - 1])
                }
            }
        }
        return dp[n][k]
    }
}
