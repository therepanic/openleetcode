class Solution {
    fun repeatedNTimes(nums: IntArray): Int {
        val n = nums.size - 2
        for (i in 0 until n) {
            if (nums[i] == nums[i + 1] || nums[i] == nums[i + 2]) {
                return nums[i]
            }
        }
        return nums[n + 1]
    }
}
