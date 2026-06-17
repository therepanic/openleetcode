class Solution {
    fun getMoneyAmount(n: Int): Int {
        val dp = Array(n + 1) { IntArray(n + 1) }
        for (length in 2..n) {
            for (start in n - length + 1 downTo 1) {
                val end = start + length - 1
                dp[start][end] = Int.MAX_VALUE
                for (pivot in start..end) {
                    val left = if (pivot > start) dp[start][pivot - 1] else 0
                    val right = if (pivot < end) dp[pivot + 1][end] else 0
                    dp[start][end] = minOf(dp[start][end], pivot + maxOf(left, right))
                }
            }
        }
        return dp[1][n]
    }
}
