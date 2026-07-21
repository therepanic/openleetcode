class Solution {
    fun closedIsland(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        var res = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid[i][j] == 1) continue
                val stack = ArrayDeque<Pair<Int, Int>>()
                stack.addLast(i to j)
                grid[i][j] = 1
                var closed = true
                while (stack.isNotEmpty()) {
                    val (r, c) = stack.removeLast()
                    if (r == 0 || c == 0 || r == m - 1 || c == n - 1)
                        closed = false
                    for ((dr, dc) in listOf(1 to 0, -1 to 0, 0 to 1, 0 to -1)) {
                        val nr = r + dr
                        val nc = c + dc
                        if (nr in 0 until m && nc in 0 until n && grid[nr][nc] == 0) {
                            grid[nr][nc] = 1
                            stack.addLast(nr to nc)
                        }
                    }
                }
                if (closed) res++
            }
        }
        return res
    }
}
