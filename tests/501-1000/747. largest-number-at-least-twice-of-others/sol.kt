class Solution {
    fun dominantIndex(nums: IntArray): Int {
        var m = -1
        var s = -1
        var idx = -1
        for (i in nums.indices) {
            if (nums[i] > m) {
                s = m
                m = nums[i]
                idx = i
            } else if (nums[i] > s) {
                s = nums[i]
            }
        }
        return if (m >= s * 2) idx else -1
    }
}
