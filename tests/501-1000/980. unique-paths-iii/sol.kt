class Solution {
    fun uniquePathsIII(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        var sx = -1
        var sy = -1
        var count = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid[i][j] == 0) count++
                if (grid[i][j] == 1) {
                    sx = i
                    sy = j
                }
            }
        }
        return backtrack(grid, m, n, sx, sy, count)
    }
    
    private fun backtrack(grid: Array<IntArray>, m: Int, n: Int, i: Int, j: Int, count: Int): Int {
        var result = 0
        val dirs = arrayOf(intArrayOf(i-1, j), intArrayOf(i+1, j), intArrayOf(i, j-1), intArrayOf(i, j+1))
        for (d in dirs) {
            val x = d[0]
            val y = d[1]
            if (x !in 0 until m || y !in 0 until n) continue
            if (grid[x][y] == 2) {
                if (count == 0) result++
            } else if (grid[x][y] == 0) {
                grid[x][y] = -1
                result += backtrack(grid, m, n, x, y, count - 1)
                grid[x][y] = 0
            }
        }
        return result
    }
}
