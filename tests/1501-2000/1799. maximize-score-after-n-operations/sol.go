func maxScore(nums []int) int {
    n := len(nums)
    dp := make([][]int, 1<<n)
    for i := range dp {
        dp[i] = make([]int, n/2+1)
        for j := range dp[i] {
            dp[i][j] = -1
        }
    }
    var dfs func(mask, op int) int
    dfs = func(mask, op int) int {
        if mask == (1<<n)-1 {
            return 0
        }
        if dp[mask][op] != -1 {
            return dp[mask][op]
        }
        ans := 0
        for i := 0; i < n; i++ {
            if (mask & (1 << i)) == 0 {
                for j := 0; j < n; j++ {
                    if j != i && (mask & (1 << j)) == 0 {
                        nmask := mask | (1 << i) | (1 << j)
                        g := gcd(nums[i], nums[j])
                        val := dfs(nmask, op+1) + g*op
                        if val > ans {
                            ans = val
                        }
                    }
                }
            }
        }
        dp[mask][op] = ans
        return ans
    }
    return dfs(0, 1)
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
