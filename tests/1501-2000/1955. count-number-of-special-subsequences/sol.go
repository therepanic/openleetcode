func countSpecialSubsequences(nums []int) int {
    const MOD = 1_000_000_007
    dp0, dp1, dp2 := 0, 0, 0
    for _, x := range nums {
        if x == 0 {
            dp0 = (2*dp0 + 1) % MOD
        } else if x == 1 {
            dp1 = (2*dp1 + dp0) % MOD
        } else {
            dp2 = (2*dp2 + dp1) % MOD
        }
    }
    return dp2
}
