class Solution {
    fun findPaths(m: Int, n: Int, maxMove: Int, startRow: Int, startColumn: Int): Int {
        val MOD = 1000000007
        val dp = Array(maxMove + 1) { Array(m) { IntArray(n) } }
        val directions = arrayOf(intArrayOf(-1, 0), intArrayOf(1, 0), intArrayOf(0, -1), intArrayOf(0, 1))

        for (move in 1..maxMove) {
            for (i in 0 until m) {
                for (j in 0 until n) {
                    for (dir in directions) {
                        val x = i + dir[0]
                        val y = j + dir[1]
                        if (x < 0 || x >= m || y < 0 || y >= n) {
                            dp[move][i][j] = (dp[move][i][j] + 1) % MOD
                        } else {
                            dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD
                        }
                    }
                }
            }
        }

        return dp[maxMove][startRow][startColumn]
    }
}
