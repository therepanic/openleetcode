func minDistance(houses []int, k int) int {
    n := len(houses)
    sort.Ints(houses)
    P := make([]int, n+1)
    for i := 0; i < n; i++ {
        P[i+1] = P[i] + houses[i]
    }
    
    G := make([][]int, n)
    for i := range G {
        G[i] = make([]int, n)
    }
    for i := 0; i < n; i++ {
        for j := i; j < n; j++ {
            mid := (i + j) / 2
            countLeft := mid - i + 1
            countRight := j - mid
            sumLeft := P[mid+1] - P[i]
            sumRight := P[j+1] - P[mid+1]
            G[i][j] = (houses[mid]*countLeft - sumLeft) + (sumRight - houses[mid]*countRight)
        }
    }
    
    dp := make([][]int, k+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
        for j := range dp[i] {
            dp[i][j] = 1 << 30
        }
    }
    dp[0][0] = 0
    
    for m := 1; m <= k; m++ {
        for j := 1; j <= n; j++ {
            best := 1 << 30
            for i := 0; i < j; i++ {
                if cand := dp[m-1][i] + G[i][j-1]; cand < best {
                    best = cand
                }
            }
            dp[m][j] = best
        }
    }
    
    return dp[k][n]
}
