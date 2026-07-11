class Solution {
    fun mergeStones(stones: IntArray, k: Int): Int {
        val n = stones.size
        if ((n - 1) % (k - 1) != 0) return -1
        
        val prefix = IntArray(n + 1)
        for (i in 1..n) {
            prefix[i] = prefix[i-1] + stones[i-1]
        }
        
        val dp = Array(n) { Array(n) { IntArray(k + 1) { Int.MAX_VALUE } } }
        
        for (i in 0 until n) {
            dp[i][i][1] = 0
        }
        
        for (len in 2..n) {
            for (i in 0..n-len) {
                val j = i + len - 1
                for (p in 2..k) {
                    var m = i
                    while (m < j) {
                        if (dp[i][m][1] != Int.MAX_VALUE && dp[m+1][j][p-1] != Int.MAX_VALUE) {
                            dp[i][j][p] = minOf(dp[i][j][p], dp[i][m][1] + dp[m+1][j][p-1])
                        }
                        m += k - 1
                    }
                }
                if (dp[i][j][k] != Int.MAX_VALUE) {
                    dp[i][j][1] = dp[i][j][k] + (prefix[j+1] - prefix[i])
                }
            }
        }
        
        return if (dp[0][n-1][1] == Int.MAX_VALUE) -1 else dp[0][n-1][1]
    }
}
