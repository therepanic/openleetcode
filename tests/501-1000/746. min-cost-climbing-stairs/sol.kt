class Solution {
    fun minCostClimbingStairs(cost: IntArray): Int {
        val dp = cost.toMutableList()
        dp.add(0)
        for (i in dp.size - 4 downTo 0) {
            dp[i] += minOf(dp[i+1], dp[i+2])
        }
        return minOf(dp[0], dp[1])
    }
}
