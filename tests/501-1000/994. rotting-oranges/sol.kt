class Solution {
    fun orangesRotting(grid: Array<IntArray>): Int {
        val n = grid.size
        val m = grid[0].size
        val q: ArrayDeque<Triple<Int, Int, Int>> = ArrayDeque()
        var fresh = 0

        for (i in 0 until n) {
            for (j in 0 until m) {
                if (grid[i][j] == 2) {
                    q.addLast(Triple(i, j, 0))
                } else if (grid[i][j] == 1) {
                    fresh++
                }
            }
        }

        val directions = arrayOf(-1 to 0, 1 to 0, 0 to -1, 0 to 1)
        var maxTime = 0
        var rotten = 0

        while (q.isNotEmpty()) {
            val (r, c, t) = q.removeFirst()
            if (t > maxTime) maxTime = t

            for ((dr, dc) in directions) {
                val nr = r + dr
                val nc = c + dc
                if (nr in 0 until n && nc in 0 until m && grid[nr][nc] == 1) {
                    grid[nr][nc] = 2
                    q.addLast(Triple(nr, nc, t + 1))
                    rotten++
                }
            }
        }

        return if (rotten == fresh) maxTime else -1
    }
}
