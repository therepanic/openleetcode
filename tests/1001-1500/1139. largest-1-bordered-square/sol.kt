class Solution {
    fun largest1BorderedSquare(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        val h = Array(m) { IntArray(n) }
        val v = Array(m) { IntArray(n) }
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid[i][j] == 1) {
                    h[i][j] = (if (j == 0) 0 else h[i][j-1]) + 1
                    v[i][j] = (if (i == 0) 0 else v[i-1][j]) + 1
                }
            }
        }
        var ans = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                val sz = minOf(h[i][j], v[i][j])
                for (k in sz downTo 1) {
                    if (h[i-k+1][j] >= k && v[i][j-k+1] >= k) {
                        ans = maxOf(ans, k)
                        break
                    }
                }
            }
        }
        return ans * ans
    }
}
