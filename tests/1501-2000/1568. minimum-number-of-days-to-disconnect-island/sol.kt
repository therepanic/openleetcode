class Solution {
    fun minDays(grid: Array<IntArray>): Int {
        fun countIslands(): Int {
            val seen = Array(grid.size) { BooleanArray(grid[0].size) }
            var islands = 0
            val dirs = arrayOf(intArrayOf(-1,0), intArrayOf(1,0), intArrayOf(0,-1), intArrayOf(0,1))
            
            for (i in grid.indices) {
                for (j in grid[0].indices) {
                    if (grid[i][j] == 1 && !seen[i][j]) {
                        islands++
                        val stack = java.util.ArrayDeque<IntArray>()
                        stack.push(intArrayOf(i, j))
                        seen[i][j] = true
                        while (stack.isNotEmpty()) {
                            val cell = stack.pop()
                            for (d in dirs) {
                                val nx = cell[0] + d[0]
                                val ny = cell[1] + d[1]
                                if (nx in grid.indices && ny in grid[0].indices && grid[nx][ny] == 1 && !seen[nx][ny]) {
                                    seen[nx][ny] = true
                                    stack.push(intArrayOf(nx, ny))
                                }
                            }
                        }
                    }
                }
            }
            return islands
        }
        
        if (countIslands() != 1) return 0
        
        for (i in grid.indices) {
            for (j in grid[0].indices) {
                if (grid[i][j] == 1) {
                    grid[i][j] = 0
                    if (countIslands() != 1) return 1
                    grid[i][j] = 1
                }
            }
        }
        return 2
    }
}
