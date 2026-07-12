class Solution {
    fun longestArithSeqLength(nums: IntArray): Int {
        val n = nums.size
        if (n <= 2) {
            return n
        }
        val dp = Array(n) { HashMap<Int, Int>() }
        var ans = 2
        for (i in 0 until n) {
            for (j in 0 until i) {
                val d = nums[i] - nums[j]
                val prev = dp[j].getOrDefault(d, 1)
                dp[i][d] = maxOf(dp[i].getOrDefault(d, 0), prev + 1)
                ans = maxOf(ans, dp[i][d]!!)
            }
        }
        return ans
    }
}
