class Solution {
    fun numSubarrayBoundedMax(nums: IntArray, left: Int, right: Int): Int {
        var res = 0
        var dp = 0
        var prev = -1
        for (i in nums.indices) {
            if (nums[i] < left && i > 0) {
                res += dp
            }
            if (nums[i] > right) {
                dp = 0
                prev = i
            }
            if (left <= nums[i] && nums[i] <= right) {
                dp = i - prev
                res += dp
            }
        }
        return res
    }
}
