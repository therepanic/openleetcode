func firstDayBeenInAllRooms(nextVisit []int) int {
    const MOD = 1000000007
    n := len(nextVisit)
    dp := make([]int64, n)

    for i := 1; i < n; i++ {
        dp[i] = (2*dp[i-1] - dp[nextVisit[i-1]] + 2 + MOD) % MOD
    }
    
    return int(dp[n-1])
}
