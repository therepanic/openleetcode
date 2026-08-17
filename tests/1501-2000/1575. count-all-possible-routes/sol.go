func countRoutes(locations []int, start int, finish int, fuel int) int {
    const MOD = 1000000007
    n := len(locations)
    dp := make([][]int, n)
    for i := range dp {
        dp[i] = make([]int, fuel+1)
    }
    for city := 0; city < n; city++ {
        if city == finish {
            dp[city][0] = 1
        }
    }
    for left := 1; left <= fuel; left++ {
        for city := 0; city < n; city++ {
            total := 0
            if city == finish {
                total = 1
            }
            for nxt := 0; nxt < n; nxt++ {
                if nxt != city {
                    cost := abs(locations[nxt] - locations[city])
                    if cost <= left {
                        total = (total + dp[nxt][left-cost]) % MOD
                    }
                }
            }
            dp[city][left] = total
        }
    }
    return dp[start][fuel]
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
