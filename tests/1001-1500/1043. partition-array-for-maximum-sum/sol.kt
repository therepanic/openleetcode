class Solution {
    fun maxSumAfterPartitioning(arr: IntArray, k: Int): Int {
        val n = arr.size
        val dp = IntArray(n + 1)
        for (i in 1..n) {
            var curr = 0
            for (j in 1..k) {
                if (i < j) break
                curr = maxOf(curr, arr[i - j])
                dp[i] = maxOf(dp[i], dp[i - j] + curr * j)
            }
        }
        return dp[n]
    }
}
