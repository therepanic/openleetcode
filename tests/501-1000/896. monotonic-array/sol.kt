class Solution {
    fun isMonotonic(nums: IntArray): Boolean {
        val n = nums.size
        if (nums[0] < nums[n - 1]) {
            for (i in 1 until n) {
                if (nums[i] < nums[i - 1]) {
                    return false
                }
            }
        } else {
            for (i in 1 until n) {
                if (nums[i] > nums[i - 1]) {
                    return false
                }
            }
        }
        return true
    }
}
