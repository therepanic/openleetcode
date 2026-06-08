class Solution {
    fun canJump(nums: IntArray): Boolean {
        var farthest = 0
        for (i in nums.indices) {
            if (i > farthest) {
                return false
            }
            farthest = maxOf(farthest, i + nums[i])
            if (farthest >= nums.size - 1) {
                return true
            }
        }
        return true
    }
}
