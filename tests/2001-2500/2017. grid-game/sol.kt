class Solution {
    fun gridGame(grid: Array<IntArray>): Long {
        var minResult = Long.MAX_VALUE
        var row1Sum = grid[0].sum().toLong()
        var row2Sum = 0L
        
        for (i in grid[0].indices) {
            row1Sum -= grid[0][i]
            minResult = minOf(minResult, maxOf(row1Sum, row2Sum))
            row2Sum += grid[1][i]
        }
        
        return minResult
    }
}
