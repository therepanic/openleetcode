class Solution {
    fun mincostTickets(days: IntArray, costs: IntArray): Int {
        val n = days.size
        var left7 = 0
        var left30 = 0
        val dp = IntArray(n)
        
        for (right in 0 until n) {
            while (days[right] - days[left7] >= 7) {
                left7++
            }
            while (days[right] - days[left30] >= 30) {
                left30++
            }
            
            val cost1 = (if (right > 0) dp[right - 1] else 0) + costs[0]
            val cost7 = (if (left7 > 0) dp[left7 - 1] else 0) + costs[1]
            val cost30 = (if (left30 > 0) dp[left30 - 1] else 0) + costs[2]
            
            dp[right] = minOf(cost1, minOf(cost7, cost30))
        }
        
        return dp[n - 1]
    }
}
