class Solution {
    fun largestSumOfAverages(nums: IntArray, k: Int): Double {
        val n = nums.size
        val pref = IntArray(n+1)
        for (i in 0 until n) pref[i+1] = pref[i] + nums[i]
        val dp = Array(n+1) { DoubleArray(k+1) }
        for (i in 1..n) dp[i][1] = pref[i].toDouble() / i
        for (p in 2..k) {
            for (i in p..n) {
                var best = 0.0
                for (j in p-1 until i) {
                    val cur = dp[j][p-1] + (pref[i] - pref[j]).toDouble() / (i - j)
                    if (cur > best) best = cur
                }
                dp[i][p] = best
            }
        }
        return dp[n][k]
    }
}
