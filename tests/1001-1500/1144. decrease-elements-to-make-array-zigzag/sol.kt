class Solution {
    fun movesToMakeZigzag(nums: IntArray): Int {
        val n = nums.size
        return minOf(findValleys(nums, 0), findValleys(nums, 1))
    }

    private fun findValleys(nums: IntArray, mode: Int): Int {
        var res = 0
        val n = nums.size
        for (i in 0 until n) {
            if (i % 2 == mode) {
                val left = if (i - 1 >= 0) nums[i - 1] else Int.MAX_VALUE
                val right = if (i + 1 < n) nums[i + 1] else Int.MAX_VALUE
                val minNeighbor = minOf(left, right)
                if (nums[i] >= minNeighbor) {
                    res += nums[i] - (minNeighbor - 1)
                }
            }
        }
        return res
    }
}
