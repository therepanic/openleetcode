class Solution {
    fun minPushBox(grid: Array<CharArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        var player: Pair<Int, Int>? = null
        var box: Pair<Int, Int>? = null
        var target: Pair<Int, Int>? = null
        
        for (i in 0 until rows) {
            for (j in 0 until cols) {
                when (grid[i][j]) {
                    'S' -> player = Pair(i, j)
                    'B' -> box = Pair(i, j)
                    'T' -> target = Pair(i, j)
                }
            }
        }
        
        val dirs = listOf(Pair(1, 0), Pair(-1, 0), Pair(0, 1), Pair(0, -1))
        val q: java.util.Queue<Triple<Pair<Int, Int>, Pair<Int, Int>, Int>> = java.util.LinkedList()
        q.offer(Triple(box!!, player!!, 0))
        val seen = mutableSetOf<Pair<Pair<Int, Int>, Pair<Int, Int>>>()
        seen.add(Pair(box!!, player!!))
        
        while (q.isNotEmpty()) {
            val (b, p, pushes) = q.poll()
            if (b == target) return pushes
            
            val reachable = mutableSetOf(p)
            val walk: java.util.Queue<Pair<Int, Int>> = java.util.LinkedList()
            walk.offer(p)
            while (walk.isNotEmpty()) {
                val (x, y) = walk.poll()
                for ((dx, dy) in dirs) {
                    val nx = x + dx
                    val ny = y + dy
                    if (nx in 0 until rows && ny in 0 until cols &&
                        Pair(nx, ny) != b && grid[nx][ny] != '#' &&
                        Pair(nx, ny) !in reachable) {
                        reachable.add(Pair(nx, ny))
                        walk.offer(Pair(nx, ny))
                    }
                }
            }
            
            for ((dx, dy) in dirs) {
                val nextBox = Pair(b.first + dx, b.second + dy)
                val behind = Pair(b.first - dx, b.second - dy)
                if (nextBox.first in 0 until rows && nextBox.second in 0 until cols &&
                    grid[nextBox.first][nextBox.second] != '#' &&
                    behind in reachable &&
                    Pair(nextBox, b) !in seen) {
                    seen.add(Pair(nextBox, b))
                    q.offer(Triple(nextBox, b, pushes + 1))
                }
            }
        }
        return -1
    }
}
