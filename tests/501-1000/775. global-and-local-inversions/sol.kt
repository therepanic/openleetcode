class Solution {
    fun isIdealPermutation(nums: IntArray): Boolean {
        for (i in nums.indices) {
            if (kotlin.math.abs(nums[i] - i) > 1) {
                return false
            }
        }
        return true
    }
}
