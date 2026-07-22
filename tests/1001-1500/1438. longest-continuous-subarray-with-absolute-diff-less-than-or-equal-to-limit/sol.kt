class Solution {
    fun longestSubarray(nums: IntArray, limit: Int): Int {
        val maxq = ArrayDeque<Int>()
        val minq = ArrayDeque<Int>()
        var left = 0
        var max_len = 1
        for (right in nums.indices) {
            while (maxq.isNotEmpty() && nums[maxq.last()] <= nums[right]) {
                maxq.removeLast()
            }
            maxq.addLast(right)
            while (minq.isNotEmpty() && nums[minq.last()] >= nums[right]) {
                minq.removeLast()
            }
            minq.addLast(right)
            while (nums[maxq.first()] - nums[minq.first()] > limit) {
                left++
                if (maxq.first() < left) {
                    maxq.removeFirst()
                }
                if (minq.first() < left) {
                    minq.removeFirst()
                }
            }
            max_len = maxOf(max_len, right - left + 1)
        }
        return max_len
    }
}
