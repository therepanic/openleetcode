class Solution {
    fun jobScheduling(startTime: IntArray, endTime: IntArray, profit: IntArray): Int {
        val n = startTime.size
        val jobs = Array(n) { i -> intArrayOf(startTime[i], endTime[i], profit[i]) }
        jobs.sortBy { it[0] }
        
        val starts = IntArray(n) { jobs[it][0] }
        val dp = IntArray(n + 1)
        
        for (i in n - 1 downTo 0) {
            var idx = starts.binarySearch(jobs[i][1], fromIndex = i + 1, toIndex = n)
            if (idx < 0) idx = -idx - 1
            val take = jobs[i][2] + dp[idx]
            val notTake = dp[i + 1]
            dp[i] = maxOf(take, notTake)
        }
        return dp[0]
    }
}
