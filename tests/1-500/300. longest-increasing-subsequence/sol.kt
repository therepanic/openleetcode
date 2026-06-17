class Solution {
    fun lengthOfLIS(nums: IntArray): Int {
        val prevIdx = -1
        val dp = Array(2500) { IntArray(2500) { -1 } }
        return helper(0, prevIdx, nums, dp)
    }

    private fun helper(i: Int, prevIdx: Int, nums: IntArray, dp: Array<IntArray>): Int {
        if (i >= nums.size) {
            return 0
        }
        if (dp[i][prevIdx + 1] != -1) {
            return dp[i][prevIdx + 1]
        }
        var steal = 0
        var skip = 0
        if (prevIdx == -1 || nums[prevIdx] < nums[i]) {
            steal = 1 + helper(i + 1, i, nums, dp)
        }
        skip = helper(i + 1, prevIdx, nums, dp)
        dp[i][prevIdx + 1] = maxOf(steal, skip)
        return maxOf(steal, skip)
    }
}
