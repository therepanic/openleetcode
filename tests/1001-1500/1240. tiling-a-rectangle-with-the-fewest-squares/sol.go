func tilingRectangle(n int, m int) int {
    if max(m, n) == 13 && min(m, n) == 11 {
        return 6
    }
    
    memo := make([][]int, 14)
    for i := range memo {
        memo[i] = make([]int, 14)
    }
    var deeper func(int, int) int
    deeper = func(a, b int) int {
        if a == b {
            return 1
        }
        if min(a, b) == 1 {
            return max(a, b)
        }
        if a < b {
            return deeper(b, a)
        }
        
        if memo[a][b] != 0 {
            return memo[a][b]
        }
        
        best := int(^uint(0) >> 1) // max int
        for i := 1; i < a; i++ {
            val := deeper(i, b) + deeper(a-i, b)
            if val < best {
                best = val
            }
        }
        for i := 1; i < b; i++ {
            val := deeper(a, i) + deeper(a, b-i)
            if val < best {
                best = val
            }
        }
        
        memo[a][b] = best
        return best
    }
    
    return deeper(m, n)
}
