class Solution {
    fun containsCycle(grid: Array<CharArray>): Boolean {
        val n = grid.size
        val m = grid[0].size
        val visited = Array(n) { BooleanArray(m) }
        val directions = arrayOf(intArrayOf(-1,0), intArrayOf(1,0), intArrayOf(0,-1), intArrayOf(0,1))
        
        for (i in 0 until n) {
            for (j in 0 until m) {
                if (!visited[i][j]) {
                    if (bfs(i, j, grid, visited, directions)) return true
                }
            }
        }
        return false
    }
    
    private fun bfs(startI: Int, startJ: Int, grid: Array<CharArray>, visited: Array<BooleanArray>, directions: Array<IntArray>): Boolean {
        val n = grid.size
        val m = grid[0].size
        val queue = ArrayDeque<IntArray>()
        queue.add(intArrayOf(startI, startJ, -1, -1))
        visited[startI][startJ] = true
        
        while (queue.isNotEmpty()) {
            val cur = queue.removeFirst()
            val x = cur[0]
            val y = cur[1]
            val px = cur[2]
            val py = cur[3]
            
            for (dir in directions) {
                val nx = x + dir[0]
                val ny = y + dir[1]
                if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue
                if (grid[nx][ny] != grid[x][y]) continue
                if (nx == px && ny == py) continue
                if (visited[nx][ny]) return true
                visited[nx][ny] = true
                queue.add(intArrayOf(nx, ny, x, y))
            }
        }
        return false
    }
}
