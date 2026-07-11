func numFactoredBinaryTrees(arr []int) int {
    const MOD = 1_000_000_007
    sort.Ints(arr)
    dp := make(map[int]int)
    s := make(map[int]bool)
    for _, v := range arr {
        s[v] = true
    }
    for _, x := range arr {
        dp[x] = 1
        for _, a := range arr {
            if a > x {
                break
            }
            if x%a == 0 {
                b := x / a
                if s[b] {
                    dp[x] = (dp[x] + dp[a]*dp[b]) % MOD
                }
            }
        }
    }
    sum := 0
    for _, v := range dp {
        sum = (sum + v) % MOD
    }
    return sum
}
