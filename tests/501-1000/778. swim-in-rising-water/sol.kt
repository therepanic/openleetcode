class Solution {
    fun swimInWater(grid: Array<IntArray>): Int {
        val n = grid.size
        val dirs = arrayOf(intArrayOf(0,-1), intArrayOf(0,1), intArrayOf(-1,0), intArrayOf(1,0))
        
        fun dfs(x: Int, y: Int, t: Int, vis: Array<BooleanArray>): Boolean {
            if (x == n - 1 && y == n - 1) return true
            vis[x][y] = true
            for (d in dirs) {
                val nx = x + d[0]
                val ny = y + d[1]
                if (nx in 0 until n && ny in 0 until n && !vis[nx][ny] && grid[nx][ny] <= t) {
                    if (dfs(nx, ny, t, vis)) return true
                }
            }
            return false
        }
        
        var low = 0
        var high = n * n - 1
        var ans = Int.MAX_VALUE
        while (low <= high) {
            val mid = (low + high) / 2
            val vis = Array(n) { BooleanArray(n) }
            if (grid[0][0] <= mid && dfs(0, 0, mid, vis)) {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return ans
    }
}
