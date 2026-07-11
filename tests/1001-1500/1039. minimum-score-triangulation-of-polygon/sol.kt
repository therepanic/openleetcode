class Solution {
    fun minScoreTriangulation(values: IntArray): Int {
        val n = values.size
        val dp = Array(n) { IntArray(n) }
        for (i in n - 1 downTo 0) {
            for (j in i + 1 until n) {
                var minVal = Int.MAX_VALUE
                for (k in i + 1 until j) {
                    val v = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j]
                    if (v < minVal) {
                        minVal = v
                    }
                }
                if (minVal != Int.MAX_VALUE) {
                    dp[i][j] = minVal
                }
            }
        }
        return dp[0][n - 1]
    }
}
