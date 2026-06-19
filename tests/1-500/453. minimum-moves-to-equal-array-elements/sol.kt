class Solution {
    fun minMoves(nums: IntArray): Int {
        val sum = nums.sum()
        val min = nums.minOrNull() ?: 0
        return sum - nums.size * min
    }
}
