class Solution {
    fun triangleNumber(nums: IntArray): Int {
        nums.sort()
        val n = nums.size
        var count = 0
        for (i in n - 1 downTo 0) {
            var left = 0
            var right = i - 1
            while (left < right) {
                if (nums[left] + nums[right] > nums[i]) {
                    count += right - left
                    right--
                } else {
                    left++
                }
            }
        }
        return count
    }
}
