class Solution {
    fun findPeakElement(nums: IntArray): Int {
        val n = nums.size
        if (n < 3) {
            return if (nums[0] >= nums[n - 1]) 0 else n - 1
        }
        var left = 0
        var right = n - 1
        while (left < right) {
            val mid = left + (right - left) / 2
            if (mid > 0 && mid < n - 1 && nums[mid - 1] < nums[mid] && nums[mid] > nums[mid + 1]) {
                return mid
            }
            if (nums[mid] < nums[mid + 1]) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
