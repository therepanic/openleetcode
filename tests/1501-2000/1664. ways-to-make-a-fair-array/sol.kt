class Solution {
    fun waysToMakeFair(nums: IntArray): Int {
        var even = 0
        var odd = 0
        var even_left = 0
        var odd_left = 0
        var result = 0
        for (idx in nums.indices) {
            if (idx % 2 == 0) {
                even += nums[idx]
            } else {
                odd += nums[idx]
            }
        }
        for (idx in nums.indices) {
            if (idx % 2 == 0) {
                even -= nums[idx]
            } else {
                odd -= nums[idx]
            }
            if (even + odd_left == odd + even_left) {
                result++
            }
            if (idx % 2 == 0) {
                even_left += nums[idx]
            } else {
                odd_left += nums[idx]
            }
        }
        return result
    }
}
