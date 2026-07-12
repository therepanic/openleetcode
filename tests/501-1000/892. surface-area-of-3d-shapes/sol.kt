class Solution {
    fun surfaceArea(grid: Array<IntArray>): Int {
        val n = grid.size
        var area = 0
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (grid[i][j] > 0) {
                    area += grid[i][j] * 6
                    area -= (grid[i][j] - 1) * 2
                    if (i + 1 < n) {
                        area -= 2 * minOf(grid[i][j], grid[i + 1][j])
                    }
                    if (j + 1 < n) {
                        area -= 2 * minOf(grid[i][j], grid[i][j + 1])
                    }
                }
            }
        }
        return area
    }
}
