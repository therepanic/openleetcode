func cherryPickup(grid [][]int) int {
    n := len(grid)
    
    dp := make([][]int, n)
    for i := range dp {
        dp[i] = make([]int, n)
        for j := range dp[i] {
            dp[i][j] = -1 << 31
        }
    }
    dp[0][0] = 0
    
    for k := 0; k <= 2*(n-1); k++ {
        newDp := make([][]int, n)
        for i := range newDp {
            newDp[i] = make([]int, n)
            for j := range newDp[i] {
                newDp[i][j] = -1 << 31
            }
        }
        
        for x1 := 0; x1 < n; x1++ {
            y1 := k - x1
            if !(y1 >= 0 && y1 < n) {
                continue
            }
            
            for x2 := 0; x2 < n; x2++ {
                y2 := k - x2
                if !(y2 >= 0 && y2 < n) {
                    continue
                }
                
                if grid[x1][y1] == -1 || grid[x2][y2] == -1 {
                    continue
                }
                
                best := dp[x1][x2]
                if x1 > 0 && dp[x1-1][x2] > best {
                    best = dp[x1-1][x2]
                }
                if x2 > 0 && dp[x1][x2-1] > best {
                    best = dp[x1][x2-1]
                }
                if x1 > 0 && x2 > 0 && dp[x1-1][x2-1] > best {
                    best = dp[x1-1][x2-1]
                }
                
                if best == -1 << 31 {
                    continue
                }
                
                best += grid[x1][y1]
                if x1 != x2 {
                    best += grid[x2][y2]
                }
                
                newDp[x1][x2] = best
            }
        }
        
        dp = newDp
    }
    
    if dp[n-1][n-1] < 0 {
        return 0
    }
    return dp[n-1][n-1]
}
