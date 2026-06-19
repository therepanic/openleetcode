class Solution {
    fun numberOfArithmeticSlices(nums: IntArray): Int {
        val n = nums.size
        var totalCount = 0
        val dp = Array(n) { mutableMapOf<Long, Int>() }

        for (i in 1 until n) {
            for (j in 0 until i) {
                val diff = nums[i].toLong() - nums[j].toLong()
                dp[i][diff] = dp[i].getOrDefault(diff, 0) + 1
                if (diff in dp[j]) {
                    val count = dp[j][diff]!!
                    dp[i][diff] = dp[i][diff]!! + count
                    totalCount += count
                }
            }
        }

        return totalCount
    }
}
