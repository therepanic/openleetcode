class Solution {
    fun canPartition(nums: IntArray): Boolean {
        val totalSum = nums.sum()
        if (totalSum % 2 != 0) return false
        val targetSum = totalSum / 2
        val dp = BooleanArray(targetSum + 1)
        dp[0] = true
        for (num in nums) {
            for (currSum in targetSum downTo num) {
                dp[currSum] = dp[currSum] || dp[currSum - num]
            }
        }
        return dp[targetSum]
    }
}
