func connectTwoGroups(cost [][]int) int {
    m := len(cost)
    n := len(cost[0])
    mn := make([]int, n)
    for j := 0; j < n; j++ {
        minVal := cost[0][j]
        for i := 1; i < m; i++ {
            if cost[i][j] < minVal {
                minVal = cost[i][j]
            }
        }
        mn[j] = minVal
    }
    memo := make([][]int, m+1)
    for i := range memo {
        memo[i] = make([]int, 1<<n)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    var fn func(int, int) int
    fn = func(i int, mask int) int {
        if memo[i][mask] != -1 {
            return memo[i][mask]
        }
        if i == m {
            sum := 0
            for j := 0; j < n; j++ {
                if (mask & (1<<j)) == 0 {
                    sum += mn[j]
                }
            }
            memo[i][mask] = sum
        } else {
            best := int(^uint(0) >> 1)
            for j := 0; j < n; j++ {
                best = min(best, cost[i][j] + fn(i+1, mask | (1<<j)))
            }
            memo[i][mask] = best
        }
        return memo[i][mask]
    }
    return fn(0, 0)
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
