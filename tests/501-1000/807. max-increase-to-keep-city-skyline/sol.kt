class Solution {
    fun maxIncreaseKeepingSkyline(grid: Array<IntArray>): Int {
        val n = grid.size
        val rowMax = IntArray(n) { r -> grid[r].max() }
        val colMax = IntArray(n) { c -> (0 until n).maxOf { r -> grid[r][c] } }
        var gain = 0
        for (r in 0 until n) {
            for (c in 0 until n) {
                gain += minOf(rowMax[r], colMax[c]) - grid[r][c]
            }
        }
        return gain
    }
}
