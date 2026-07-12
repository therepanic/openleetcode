func maxSumAfterPartitioning(arr []int, k int) int {
    n := len(arr)
    dp := make([]int, n+1)
    for i := 1; i <= n; i++ {
        curr := 0
        for j := 1; j <= k; j++ {
            if i < j {
                break
            }
            if arr[i-j] > curr {
                curr = arr[i-j]
            }
            if dp[i-j]+curr*j > dp[i] {
                dp[i] = dp[i-j] + curr*j
            }
        }
    }
    return dp[n]
}
