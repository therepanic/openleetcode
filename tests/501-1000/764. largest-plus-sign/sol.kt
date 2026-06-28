class Solution {
    fun orderOfLargestPlusSign(n: Int, mines: Array<IntArray>): Int {
        val s = HashSet<Int>()
        for (mine in mines) {
            s.add(mine[0] * n + mine[1])
        }
        val dp = Array(n) { IntArray(n) { n } }
        
        for (i in 0 until n) {
            var count = 0
            for (j in 0 until n) {
                count = if (s.contains(i * n + j)) 0 else count + 1
                dp[i][j] = minOf(dp[i][j], count)
            }
            count = 0
            for (j in n - 1 downTo 0) {
                count = if (s.contains(i * n + j)) 0 else count + 1
                dp[i][j] = minOf(dp[i][j], count)
            }
        }
        
        for (j in 0 until n) {
            var count = 0
            for (i in 0 until n) {
                count = if (s.contains(i * n + j)) 0 else count + 1
                dp[i][j] = minOf(dp[i][j], count)
            }
            count = 0
            for (i in n - 1 downTo 0) {
                count = if (s.contains(i * n + j)) 0 else count + 1
                dp[i][j] = minOf(dp[i][j], count)
            }
        }
        
        var ans = 0
        for (i in 0 until n) {
            for (j in 0 until n) {
                ans = maxOf(ans, dp[i][j])
            }
        }
        return ans
    }
}
