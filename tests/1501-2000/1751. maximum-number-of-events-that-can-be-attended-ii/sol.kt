class Solution {
    fun maxValue(events: Array<IntArray>, k: Int): Int {
        events.sortBy { it[1] }
        val n = events.size
        val dp = Array(n + 1) { IntArray(k + 1) }
        
        for (i in 1..n) {
            val start = events[i - 1][0]
            val value = events[i - 1][2]
            val prev = findLastNonOverlapping(events, i - 1, start)
            for (j in 1..k) {
                dp[i][j] = maxOf(dp[i - 1][j], dp[prev + 1][j - 1] + value)
            }
        }
        return dp[n][k]
    }
    
    private fun findLastNonOverlapping(events: Array<IntArray>, right: Int, targetStart: Int): Int {
        var left = 0
        var res = -1
        var r = right
        while (left <= r) {
            val mid = (left + r) / 2
            if (events[mid][1] < targetStart) {
                res = mid
                left = mid + 1
            } else {
                r = mid - 1
            }
        }
        return res
    }
}
