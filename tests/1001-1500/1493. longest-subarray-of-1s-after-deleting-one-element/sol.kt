class Solution {
    fun longestSubarray(nums: IntArray): Int {
        var left = 0
        var zeros = 0
        var res = 0
        for (right in nums.indices) {
            if (nums[right] == 0) zeros++
            while (zeros > 1) {
                if (nums[left] == 0) zeros--
                left++
            }
            res = maxOf(res, right - left)
        }
        return res
    }
}
