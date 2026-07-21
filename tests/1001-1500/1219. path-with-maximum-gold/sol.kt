class Solution {
    private var n = 0
    private var m = 0
    private lateinit var visited: Array<BooleanArray>
    private val directions = arrayOf(intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(1, 0), intArrayOf(0, -1))
    
    fun getMaximumGold(grid: Array<IntArray>): Int {
        n = grid.size
        m = grid[0].size
        visited = Array(n) { BooleanArray(m) }
        
        var ans = 0
        for (i in 0 until n) {
            for (j in 0 until m) {
                if (!visited[i][j] && grid[i][j] != 0) {
                    ans = maxOf(ans, dfs(grid, i, j))
                }
            }
        }
        return ans
    }
    
    private fun dfs(grid: Array<IntArray>, r: Int, c: Int): Int {
        var total = grid[r][c]
        visited[r][c] = true
        
        var curr = 0
        for (dir in directions) {
            val nr = r + dir[0]
            val nc = c + dir[1]
            if (nr in 0 until n && nc in 0 until m) {
                if (grid[nr][nc] != 0 && !visited[nr][nc]) {
                    val a = dfs(grid, nr, nc)
                    curr = maxOf(curr, a)
                }
            }
        }
        total += curr
        visited[r][c] = false
        return total
    }
}
