class Solution {
    fun findTargetSumWays(nums: IntArray, target: Int): Int {
        val total = nums.sum()
        if (kotlin.math.abs(target) > total || (target + total) % 2 != 0) return 0
        val sum = (target + total) / 2
        val dp = IntArray(sum + 1)
        dp[0] = 1

        for (num in nums) {
            for (j in sum downTo num) {
                dp[j] += dp[j - num]
            }
        }

        return dp[sum]
    }
}
