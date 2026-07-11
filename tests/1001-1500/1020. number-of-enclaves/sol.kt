import java.util.*

class Solution {
    fun numEnclaves(grid: Array<IntArray>): Int {
        var total = 0
        for (row in grid) {
            for (v in row) {
                total += v
            }
        }
        
        val m = grid.size
        val n = grid[0].size
        if (m == 1 || n == 1) return 0
        
        val q: Queue<Pair<Int, Int>> = LinkedList()
        val seen = HashSet<Pair<Int, Int>>()
        
        for (i in 0 until n) {
            if (grid[0][i] == 1) {
                q.offer(Pair(0, i))
                seen.add(Pair(0, i))
            }
            if (grid[m-1][i] == 1) {
                q.offer(Pair(m-1, i))
                seen.add(Pair(m-1, i))
            }
        }
        for (i in 1 until m-1) {
            if (grid[i][0] == 1) {
                q.offer(Pair(i, 0))
                seen.add(Pair(i, 0))
            }
            if (grid[i][n-1] == 1) {
                q.offer(Pair(i, n-1))
                seen.add(Pair(i, n-1))
            }
        }
        
        val directions = arrayOf(intArrayOf(0,1), intArrayOf(1,0), intArrayOf(0,-1), intArrayOf(-1,0))
        var nextTotal = 0
        
        while (q.isNotEmpty()) {
            val (x, y) = q.poll()
            nextTotal++
            
            for (dir in directions) {
                val nx = x + dir[0]
                val ny = y + dir[1]
                val pair = Pair(nx, ny)
                if (nx in 0 until m && ny in 0 until n && grid[nx][ny] == 1 && pair !in seen) {
                    q.offer(pair)
                    seen.add(pair)
                }
            }
        }
        
        return total - nextTotal
    }
}
