class Solution {
    fun ways(pizza: Array<String>, k: Int): Int {
        val m = pizza.size
        val n = pizza[0].length
        val MOD = 1_000_000_007
        val preSum = Array(m + 1) { IntArray(n + 1) }

        for (r in m - 1 downTo 0) {
            for (c in n - 1 downTo 0) {
                preSum[r][c] = preSum[r][c + 1] + preSum[r + 1][c] - preSum[r + 1][c + 1] + (if (pizza[r][c] == 'A') 1 else 0)
            }
        }

        val dp = Array(k) { Array(m) { IntArray(n) } }

        for (r in 0 until m) {
            for (c in 0 until n) {
                dp[0][r][c] = if (preSum[r][c] > 0) 1 else 0
            }
        }

        for (cuts in 1 until k) {
            for (r in 0 until m) {
                for (c in 0 until n) {
                    if (preSum[r][c] == 0) continue
                    var ans = 0
                    for (nr in r + 1 until m) {
                        if (preSum[r][c] - preSum[nr][c] > 0) {
                            ans = (ans + dp[cuts - 1][nr][c]) % MOD
                        }
                    }
                    for (nc in c + 1 until n) {
                        if (preSum[r][c] - preSum[r][nc] > 0) {
                            ans = (ans + dp[cuts - 1][r][nc]) % MOD
                        }
                    }
                    dp[cuts][r][c] = ans
                }
            }
        }

        return dp[k - 1][0][0]
    }
}
