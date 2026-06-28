func strangePrinter(s string) int {
    n := len(s)
    memo := make([][]int, n)
    for i := range memo {
        memo[i] = make([]int, n)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    
    var minTurns func(start, end int) int
    minTurns = func(start, end int) int {
        if start > end {
            return 0
        }
        
        if memo[start][end] != -1 {
            return memo[start][end]
        }
        
        res := minTurns(start, end-1) + 1
        
        for middle := start; middle < end; middle++ {
            if s[middle] == s[end] {
                val := minTurns(start, middle) + minTurns(middle+1, end-1)
                if val < res {
                    res = val
                }
            }
        }
        
        memo[start][end] = res
        return res
    }
    
    return minTurns(0, n-1)
}
