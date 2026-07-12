class Solution {
    fun numMovesStones(a: Int, b: Int, c: Int): IntArray {
        val stones = intArrayOf(a, b, c)
        stones.sort()
        val x = stones[0]
        val y = stones[1]
        val z = stones[2]
        val minMove = when {
            z - x == 2 -> 0
            y - x <= 2 || z - y <= 2 -> 1
            else -> 2
        }
        val maxMove = z - x - 2
        return intArrayOf(minMove, maxMove)
    }
}
