func numWays(steps int, arrLen int) int {
    const MOD = 1000000007
    maxPos := steps / 2
    if arrLen-1 < maxPos {
        maxPos = arrLen - 1
    }
    dp := make([]int, maxPos+1)
    dp[0] = 1
    for step := 0; step < steps; step++ {
        newDp := make([]int, maxPos+1)
        for pos := 0; pos <= maxPos; pos++ {
            if dp[pos] == 0 {
                continue
            }
            newDp[pos] = (newDp[pos] + dp[pos]) % MOD
            if pos > 0 {
                newDp[pos-1] = (newDp[pos-1] + dp[pos]) % MOD
            }
            if pos < maxPos {
                newDp[pos+1] = (newDp[pos+1] + dp[pos]) % MOD
            }
        }
        dp = newDp
    }
    return dp[0]
}
