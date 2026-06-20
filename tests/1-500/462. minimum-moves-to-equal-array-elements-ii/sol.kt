class Solution {
    fun minMoves2(nums: IntArray): Long {
        nums.sort()
        val median = nums[nums.size / 2]
        var moves = 0L
        for (num in nums) {
            moves += kotlin.math.abs(num.toLong() - median.toLong())
        }
        return moves
    }
}
