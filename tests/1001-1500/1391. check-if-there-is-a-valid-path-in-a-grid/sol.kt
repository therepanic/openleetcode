class Solution {
    fun hasValidPath(grid: Array<IntArray>): Boolean {
        val m = grid.size
        val n = grid[0].size
        
        val dir = mapOf(
            1 to arrayOf(intArrayOf(0, -1), intArrayOf(0, 1)),
            2 to arrayOf(intArrayOf(-1, 0), intArrayOf(1, 0)),
            3 to arrayOf(intArrayOf(0, -1), intArrayOf(1, 0)),
            4 to arrayOf(intArrayOf(0, 1), intArrayOf(1, 0)),
            5 to arrayOf(intArrayOf(0, -1), intArrayOf(-1, 0)),
            6 to arrayOf(intArrayOf(0, 1), intArrayOf(-1, 0))
        )
        
        val vis = Array(m) { BooleanArray(n) }
        val q: java.util.Queue<IntArray> = java.util.LinkedList()
        q.offer(intArrayOf(0, 0))
        vis[0][0] = true
        
        while (q.isNotEmpty()) {
            val cur = q.poll()
            val r = cur[0]
            val c = cur[1]
            
            if (r == m - 1 && c == n - 1) {
                return true
            }
            
            for (d in dir[grid[r][c]]!!) {
                val nr = r + d[0]
                val nc = c + d[1]
                
                if (nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]) {
                    continue
                }
                
                for (bd in dir[grid[nr][nc]]!!) {
                    if (nr + bd[0] == r && nc + bd[1] == c) {
                        vis[nr][nc] = true
                        q.offer(intArrayOf(nr, nc))
                    }
                }
            }
        }
        
        return false
    }
}
