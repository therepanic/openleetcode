class Solution {
    fun profitableSchemes(n: Int, minProfit: Int, group: IntArray, profit: IntArray): Int {
        val mod = 1_000_000_007
        val dp = Array(n + 1) { IntArray(minProfit + 1) }
        dp[0][0] = 1
        for (k in 1..group.size) {
            val g = group[k - 1]
            val p = profit[k - 1]
            for (i in n downTo g) {
                for (j in minProfit downTo 0) {
                    dp[i][j] = (dp[i][j] + dp[i - g][maxOf(0, j - p)]) % mod
                }
            }
        }
        var ans = 0
        for (i in 0..n) {
            ans = (ans + dp[i][minProfit]) % mod
        }
        return ans
    }
}
