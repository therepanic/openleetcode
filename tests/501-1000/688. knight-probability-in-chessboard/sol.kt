class Solution {
    fun knightProbability(n: Int, k: Int, row: Int, column: Int): Double {
        if (k == 0) return 1.0
        
        val moves = arrayOf(intArrayOf(1, 2), intArrayOf(2, 1), intArrayOf(2, -1), intArrayOf(1, -2),
                             intArrayOf(-1, -2), intArrayOf(-2, -1), intArrayOf(-2, 1), intArrayOf(-1, 2))
        
        var dp = Array(n) { DoubleArray(n) }
        dp[row][column] = 1.0
        
        repeat(k) {
            val nextDp = Array(n) { DoubleArray(n) }
            for (r in 0 until n) {
                for (c in 0 until n) {
                    if (dp[r][c] == 0.0) continue
                    for (move in moves) {
                        val nr = r + move[0]
                        val nc = c + move[1]
                        if (nr in 0 until n && nc in 0 until n) {
                            nextDp[nr][nc] += dp[r][c] / 8.0
                        }
                    }
                }
            }
            dp = nextDp
        }
        
        var total = 0.0
        for (r in 0 until n) {
            for (c in 0 until n) {
                total += dp[r][c]
            }
        }
        return total
    }
}
