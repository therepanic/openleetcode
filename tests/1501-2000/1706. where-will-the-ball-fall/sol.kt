class Solution {
    fun findBall(grid: Array<IntArray>): IntArray {
        val m = grid.size
        val n = grid[0].size
        val result = IntArray(n)
        for (col in 0 until n) {
            var cur = col
            for (row in 0 until m) {
                val d = grid[row][cur]
                val nxt = cur + d
                if (nxt < 0 || nxt >= n || grid[row][nxt] != d) {
                    cur = -1
                    break
                }
                cur = nxt
            }
            result[col] = cur
        }
        return result
    }
}
