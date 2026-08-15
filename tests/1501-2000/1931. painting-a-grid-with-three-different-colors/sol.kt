class Solution {
    fun colorTheGrid(m: Int, n: Int): Int {
        val mod = 1000000007
        var total = 1
        repeat(m) { total *= 3 }
        val dp = Array(n+1) { IntArray(total) }
        val rowValid = Array(total) { IntArray(total) }
        val good = mutableListOf<Int>()
        val pattern = Array(total) { IntArray(m) }
        for (i in 0 until total) {
            var value = i
            var valid = true
            for (k in 0 until m) {
                pattern[i][k] = value % 3
                value /= 3
            }
            for (k in 1 until m) {
                if (pattern[i][k] == pattern[i][k-1]) {
                    valid = false
                    break
                }
            }
            if (valid) good.add(i)
        }
        for (i in good) dp[1][i] = 1
        for (i in good) {
            for (j in good) {
                rowValid[i][j] = 1
                for (k in 0 until m) {
                    if (pattern[i][k] == pattern[j][k]) {
                        rowValid[i][j] = 0
                        break
                    }
                }
            }
        }
        for (col in 2..n) {
            for (i in good) {
                var totalWays = 0L
                for (j in good) {
                    if (rowValid[i][j] == 1) {
                        totalWays += dp[col-1][j]
                    }
                }
                dp[col][i] = (totalWays % mod).toInt()
            }
        }
        var ans = 0L
        for (i in good) ans += dp[n][i]
        return (ans % mod).toInt()
    }
}
