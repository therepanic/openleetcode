func numMusicPlaylists(n int, goal int, k int) int {
    const MOD = 1000000007
    dp := [2][]int{
        make([]int, n+1),
        make([]int, n+1),
    }
    dp[0][0] = 1

    for i := 1; i <= goal; i++ {
        dp[i%2][0] = 0
        limit := i
        if n < i {
            limit = n
        }
        for j := 1; j <= limit; j++ {
            dp[i%2][j] = dp[(i-1)%2][j-1] * (n - (j - 1)) % MOD
            if j > k {
                dp[i%2][j] = (dp[i%2][j] + dp[(i-1)%2][j]*(j-k)) % MOD
            }
        }
    }

    return dp[goal%2][n]
}
