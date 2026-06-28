class Solution {
    fun findUnsortedSubarray(nums: IntArray): Int {
        val sortedNums = nums.sorted()
        var start = nums.size
        var end = 0

        for (i in nums.indices) {
            if (nums[i] != sortedNums[i]) {
                start = minOf(start, i)
                end = maxOf(end, i)
            }
        }

        return if (end - start >= 0) end - start + 1 else 0
    }
}
