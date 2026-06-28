class Solution {
    fun minSteps(n: Int): Int {
        if (n == 1) return 0
        val dp = IntArray(n + 1)
        for (i in 2..n) {
            dp[i] = i
            for (j in i - 1 downTo 1) {
                if (i % j == 0) {
                    dp[i] = dp[j] + (i / j)
                    break
                }
            }
        }
        return dp[n]
    }
}
