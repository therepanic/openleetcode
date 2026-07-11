class Solution {
    fun shortestBridge(grid: Array<IntArray>): Int {
        val n = grid.size
        val directions = arrayOf(intArrayOf(-1, 0), intArrayOf(1, 0), intArrayOf(0, 1), intArrayOf(0, -1))
        val visited = Array(n) { BooleanArray(n) }
        val q: ArrayDeque<IntArray> = ArrayDeque()
        
        fun dfs(r: Int, c: Int) {
            visited[r][c] = true
            for ((dr, dc) in directions) {
                val nr = r + dr
                val nc = c + dc
                if (nr in 0 until n && nc in 0 until n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 0) {
                        visited[nr][nc] = true
                        q.addLast(intArrayOf(nr, nc, 1))
                    } else {
                        dfs(nr, nc)
                    }
                }
            }
        }
        
        var found = false
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (grid[i][j] == 1) {
                    dfs(i, j)
                    found = true
                    break
                }
            }
            if (found) break
        }
        
        while (q.isNotEmpty()) {
            val (r, c, dist) = q.removeFirst()
            for ((dr, dc) in directions) {
                val nr = r + dr
                val nc = c + dc
                if (nr in 0 until n && nc in 0 until n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 1) return dist
                    visited[nr][nc] = true
                    q.addLast(intArrayOf(nr, nc, dist + 1))
                }
            }
        }
        return 0
    }
}
