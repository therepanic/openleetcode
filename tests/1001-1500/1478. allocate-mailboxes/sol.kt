class Solution {
    fun minDistance(houses: IntArray, k: Int): Int {
        val n = houses.size
        houses.sort()
        val P = IntArray(n + 1)
        for (i in 0 until n) {
            P[i + 1] = P[i] + houses[i]
        }
        
        val G = Array(n) { IntArray(n) }
        for (i in 0 until n) {
            for (j in i until n) {
                val mid = (i + j) / 2
                val countLeft = mid - i + 1
                val countRight = j - mid
                val sumLeft = P[mid + 1] - P[i]
                val sumRight = P[j + 1] - P[mid + 1]
                G[i][j] = (houses[mid] * countLeft - sumLeft) + (sumRight - houses[mid] * countRight)
            }
        }
        
        val dp = Array(k + 1) { IntArray(n + 1) { Int.MAX_VALUE / 2 } }
        dp[0][0] = 0
        
        for (m in 1..k) {
            for (j in 1..n) {
                var best = Int.MAX_VALUE
                for (i in 0 until j) {
                    best = minOf(best, dp[m-1][i] + G[i][j-1])
                }
                dp[m][j] = best
            }
        }
        
        return dp[k][n]
    }
}
