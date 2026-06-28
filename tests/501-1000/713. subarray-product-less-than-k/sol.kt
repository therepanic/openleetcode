class Solution {
    fun numSubarrayProductLessThanK(nums: IntArray, k: Int): Int {
        if (k <= 1) {
            return 0
        }

        var left = 0
        var product = 1
        var ans = 0

        for (right in nums.indices) {
            product *= nums[right]

            while (product >= k) {
                product /= nums[left]
                left++
            }

            ans += (right - left + 1)
        }

        return ans
    }
}
