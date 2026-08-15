func maxProductPath(grid [][]int) int {
    r := len(grid)
    c := len(grid[0])
    const MOD = 1000000007
    dp := make([][][]int64, r)
    for i := range dp {
        dp[i] = make([][]int64, c)
        for j := range dp[i] {
            dp[i][j] = make([]int64, 2)
        }
    }
    
    p := int64(grid[0][0])
    dp[0][0][0] = p
    dp[0][0][1] = p
    for j := 1; j < c; j++ {
        p *= int64(grid[0][j])
        dp[0][j][0] = p
        dp[0][j][1] = p
    }
    
    p = int64(grid[0][0])
    for i := 1; i < r; i++ {
        p *= int64(grid[i][0])
        dp[i][0][0] = p
        dp[i][0][1] = p
        for j := 1; j < c; j++ {
            x := int64(grid[i][j])
            vals := []int64{x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]}
            mn := vals[0]
            mx := vals[0]
            for _, v := range vals[1:] {
                if v < mn {
                    mn = v
                }
                if v > mx {
                    mx = v
                }
            }
            dp[i][j][0] = mn
            dp[i][j][1] = mx
        }
    }
    
    ans := dp[r-1][c-1][1]
    if ans < 0 {
        return -1
    }
    return int(ans % MOD)
}
