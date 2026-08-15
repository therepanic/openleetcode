func minSpaceWastedKResizing(nums []int, k int) int {
    n := len(nums)
    P := make([]int, n+1)
    for i := 0; i < n; i++ {
        P[i+1] = P[i] + nums[i]
    }
    dp := make([]int, n+1)
    const inf = int(^uint(0) >> 1)
    for i := range dp { dp[i] = inf }
    maxV := 0
    for i := 1; i <= n; i++ {
        if nums[i-1] > maxV {
            maxV = nums[i-1]
        }
        dp[i] = maxV*i - P[i]
    }
    for t := 0; t < k; t++ {
        newDp := make([]int, n+1)
        for i := range newDp { newDp[i] = inf }
        newDp[0] = 0
        for i := 1; i <= n; i++ {
            curMax := 0
            for j := i - 1; j >= 0; j-- {
                if nums[j] > curMax {
                    curMax = nums[j]
                }
                waste := curMax*(i-j) - (P[i] - P[j])
                if dp[j] != inf && dp[j]+waste < newDp[i] {
                    newDp[i] = dp[j] + waste
                }
            }
        }
        dp = newDp
    }
    return dp[n]
}
