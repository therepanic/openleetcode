class Solution {
    fun countServers(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        val rowCounts = IntArray(m)
        val colCounts = IntArray(n)
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid[i][j] == 1) {
                    rowCounts[i]++
                    colCounts[j]++
                }
            }
        }
        var result = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid[i][j] == 1 && (rowCounts[i] > 1 || colCounts[j] > 1)) {
                    result++
                }
            }
        }
        return result
    }
}
