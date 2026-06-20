class Solution {
    fun numIslands(grid: Array<Array<String>>): Int {
        val rows = grid.size
        val cols = grid[0].size
        var islands = 0
        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] != "1") {
                    continue
                }
                islands++
                val queue = ArrayList<Pair<Int, Int>>()
                var index = 0
                queue.add(Pair(r, c))
                grid[r][c] = "0"
                while (index < queue.size) {
                    val cell = queue[index]
                    index++
                    for (i in 0 until 4) {
                        val nr = cell.first + dr[i]
                        val nc = cell.second + dc[i]
                        if (nr in 0 until rows && nc in 0 until cols && grid[nr][nc] == "1") {
                            grid[nr][nc] = "0"
                            queue.add(Pair(nr, nc))
                        }
                    }
                }
            }
        }

        return islands
    }
}
