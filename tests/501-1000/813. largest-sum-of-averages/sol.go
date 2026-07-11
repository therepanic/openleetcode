func largestSumOfAverages(nums []int, k int) float64 {
    n := len(nums)
    pref := make([]int, n+1)
    for i, x := range nums {
        pref[i+1] = pref[i] + x
    }
    dp := make([][]float64, n+1)
    for i := range dp {
        dp[i] = make([]float64, k+1)
    }
    for i := 1; i <= n; i++ {
        dp[i][1] = float64(pref[i]) / float64(i)
    }
    for p := 2; p <= k; p++ {
        for i := p; i <= n; i++ {
            best := 0.0
            for j := p-1; j < i; j++ {
                val := dp[j][p-1] + float64(pref[i]-pref[j]) / float64(i-j)
                if val > best {
                    best = val
                }
            }
            dp[i][p] = best
        }
    }
    return dp[n][k]
}
