class Solution {
    fun matrixScore(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        for (row in grid) {
            if (row[0] == 0) {
                for (i in 0 until cols) {
                    row[i] = row[i] xor 1
                }
            }
        }
        for (j in 1 until cols) {
            var temp = 0
            for (i in 0 until rows) {
                temp += grid[i][j]
            }
            if (2 * temp < rows) {
                for (i in 0 until rows) {
                    grid[i][j] = grid[i][j] xor 1
                }
            }
        }
        var ans = 0
        for (row in grid) {
            var rowValue = 0
            for (bit in row) {
                rowValue = (rowValue shl 1) or bit
            }
            ans += rowValue
        }
        return ans
    }
}
