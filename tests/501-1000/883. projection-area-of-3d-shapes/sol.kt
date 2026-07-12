class Solution {
    fun projectionArea(grid: Array<IntArray>): Int {
        var xyArea = 0
        var yzArea = 0
        var zxArea = 0
        val rows = grid.size
        val cols = grid[0].size
        for (i in 0 until rows) {
            var maxRow = 0
            for (j in 0 until cols) {
                if (grid[i][j] > 0) xyArea++
                if (grid[i][j] > maxRow) maxRow = grid[i][j]
            }
            yzArea += maxRow
        }
        for (j in 0 until cols) {
            var maxCol = 0
            for (i in 0 until rows) {
                if (grid[i][j] > maxCol) maxCol = grid[i][j]
            }
            zxArea += maxCol
        }
        return xyArea + yzArea + zxArea
    }
}
