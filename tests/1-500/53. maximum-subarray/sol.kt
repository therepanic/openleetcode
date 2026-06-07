class Solution {
    fun maxSubArray(nums: IntArray): Int {
        var best = nums[0]
        var cur = 0
        for (num in nums) {
            if (cur < 0) {
                cur = 0
            }
            cur += num
            if (cur > best) {
                best = cur
            }
        }
        return best
    }
}
