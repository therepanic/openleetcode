func numOfArrays(n int, m int, k int) int {
    const MOD = 1_000_000_007
    
    dp := make([][][]int, n+1)
    for i := range dp {
        dp[i] = make([][]int, k+1)
        for j := range dp[i] {
            dp[i][j] = make([]int, m+1)
            for l := range dp[i][j] {
                dp[i][j][l] = -1
            }
        }
    }

    var solve func(idx, searchCost, maxValue int) int
    solve = func(idx, searchCost, maxValue int) int {
        if idx == n {
            if searchCost == k {
                return 1
            }
            return 0
        }
        if searchCost > k {
            return 0
        }
        if dp[idx][searchCost][maxValue] != -1 {
            return dp[idx][searchCost][maxValue]
        }

        result := 0
        for i := 1; i <= m; i++ {
            if i > maxValue {
                result = (result + solve(idx+1, searchCost+1, i)) % MOD
            } else {
                result = (result + solve(idx+1, searchCost, maxValue)) % MOD
            }
        }

        dp[idx][searchCost][maxValue] = result
        return result
    }

    return solve(0, 0, 0)
}
