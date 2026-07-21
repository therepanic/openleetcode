class Solution {
    fun palindromePartition(s: String, k: Int): Int {
        val n = s.length
        val c = Array(n) { IntArray(n) }
        for (l in 2..n) {
            for (i in 0..n - l) {
                val j = i + l - 1
                c[i][j] = (if (l > 2) c[i + 1][j - 1] else 0) + if (s[i] != s[j]) 1 else 0
            }
        }
        val dp = Array(k + 1) { IntArray(n + 1) { Int.MAX_VALUE / 2 } }
        dp[0][0] = 0
        for (i in 1..n) {
            dp[1][i] = c[0][i - 1]
        }
        for (p in 2..k) {
            for (i in p..n) {
                var mn = Int.MAX_VALUE / 2
                for (t in p - 1 until i) {
                    mn = minOf(mn, dp[p - 1][t] + c[t][i - 1])
                }
                dp[p][i] = mn
            }
        }
        return dp[k][n]
    }
}
