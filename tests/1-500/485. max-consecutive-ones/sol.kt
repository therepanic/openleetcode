class Solution {
    fun findMaxConsecutiveOnes(nums: IntArray): Int {
        var res = 0
        var left = 0
        for (right in nums.indices) {
            if (nums[right] == 0) {
                left = right + 1
            } else {
                res = maxOf(res, right - left + 1)
            }
        }
        return res
    }
}
