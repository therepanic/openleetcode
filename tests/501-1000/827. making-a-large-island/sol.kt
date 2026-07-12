class Solution {
    fun largestIsland(grid: Array<IntArray>): Int {
        val r = grid.size
        val c = grid[0].size
        val dirs = arrayOf(intArrayOf(1, 0), intArrayOf(0, 1), intArrayOf(-1, 0), intArrayOf(0, -1))
        var island = 2
        val a = mutableMapOf<Int, Int>()
        
        fun dfs(i: Int, j: Int, x: Int): Int {
            var tot = 1
            grid[i][j] = x
            for (d in dirs) {
                val nx = i + d[0]
                val ny = j + d[1]
                if (nx in 0 until r && ny in 0 until c && grid[nx][ny] == 1) {
                    tot += dfs(nx, ny, x)
                }
            }
            return tot
        }
        
        for (i in 0 until r) {
            for (j in 0 until c) {
                if (grid[i][j] == 1) {
                    a[island] = dfs(i, j, island)
                    island++
                }
            }
        }
        
        var res = 0
        for (i in 0 until r) {
            for (j in 0 until c) {
                if (grid[i][j] == 0) {
                    val y = mutableSetOf<Int>()
                    for (d in dirs) {
                        val nx = i + d[0]
                        val ny = j + d[1]
                        if (nx in 0 until r && ny in 0 until c && grid[nx][ny] != 0) {
                            y.add(grid[nx][ny])
                        }
                    }
                    var tot = 1
                    for (b in y) {
                        tot += a[b] ?: 0
                    }
                    res = maxOf(res, tot)
                }
            }
        }
        
        return maxOf(res, a[2] ?: 0)
    }
}
