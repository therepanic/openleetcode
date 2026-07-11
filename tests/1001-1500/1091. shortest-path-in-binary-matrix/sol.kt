class Solution {
    fun shortestPathBinaryMatrix(grid: Array<IntArray>): Int {
        val n = grid.size
        
        if (grid[0][0] == 1 || grid[n - 1][n - 1] == 1) {
            return -1
        }
        
        if (n == 1) {
            return 1
        }
        
        val dist = Array(n) { IntArray(n) { Int.MAX_VALUE } }
        dist[0][0] = 1
        
        val q = java.util.LinkedList<IntArray>()
        q.offer(intArrayOf(0, 0, 1))
        
        val directions = arrayOf(
            intArrayOf(-1, 0), intArrayOf(-1, -1), intArrayOf(0, 1), intArrayOf(-1, 1),
            intArrayOf(1, 0), intArrayOf(1, -1), intArrayOf(0, -1), intArrayOf(1, 1)
        )
        
        while (q.isNotEmpty()) {
            val curr = q.poll()
            val r = curr[0]
            val c = curr[1]
            val dis = curr[2]
            
            for (dir in directions) {
                val nr = r + dir[0]
                val nc = c + dir[1]
                
                if (nr in 0 until n && nc in 0 until n &&
                    grid[nr][nc] == 0 && dis + 1 < dist[nr][nc]) {
                    
                    dist[nr][nc] = dis + 1
                    
                    if (nr == n - 1 && nc == n - 1) {
                        return dis + 1
                    }
                    
                    q.offer(intArrayOf(nr, nc, dis + 1))
                }
            }
        }
        
        return -1
    }
}
