class Solution {
    fun minDifference(nums: IntArray): Int {
        if (nums.size <= 3) {
            return 0
        }
        nums.sort()
        val n = nums.size
        return minOf(
            nums[n-4] - nums[0],
            nums[n-3] - nums[1],
            nums[n-2] - nums[2],
            nums[n-1] - nums[3]
        )
    }
}
