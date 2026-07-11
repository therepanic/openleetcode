func shortestSuperstring(words []string) string {
    n := len(words)
    overlap := make([][]int, n)
    for i := range overlap {
        overlap[i] = make([]int, n)
    }
    
    getOverlap := func(a, b string) int {
        maxOlap := 0
        for k := 1; k <= len(a) && k <= len(b); k++ {
            if a[len(a)-k:] == b[:k] {
                if k > maxOlap {
                    maxOlap = k
                }
            }
        }
        return maxOlap
    }
    
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if i != j {
                overlap[i][j] = getOverlap(words[i], words[j])
            }
        }
    }
    
    total := 1 << n
    dp := make([][]string, total)
    for i := range dp {
        dp[i] = make([]string, n)
    }
    for i := 0; i < n; i++ {
        dp[1<<i][i] = words[i]
    }
    
    for mask := 0; mask < total; mask++ {
        for u := 0; u < n; u++ {
            if mask&(1<<u) == 0 {
                continue
            }
            for v := 0; v < n; v++ {
                if mask&(1<<v) != 0 {
                    continue
                }
                newMask := mask | (1 << v)
                candidate := dp[mask][u] + words[v][overlap[u][v]:]
                if dp[newMask][v] == "" || len(candidate) < len(dp[newMask][v]) {
                    dp[newMask][v] = candidate
                }
            }
        }
    }
    
    shortest := ""
    for _, candidate := range dp[total-1] {
        if shortest == "" || len(candidate) < len(shortest) {
            shortest = candidate
        }
    }
    return shortest
}
