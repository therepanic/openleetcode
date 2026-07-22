func stoneGameII(piles []int) int {
    n := len(piles)
    suffix := make([]int, n+1)
    for i := n - 1; i >= 0; i-- {
        suffix[i] = suffix[i+1] + piles[i]
    }
    memo := make([][]int, n)
    for i := 0; i < n; i++ {
        memo[i] = make([]int, n+1)
        for j := 0; j <= n; j++ {
            memo[i][j] = -1
        }
    }
    
    var best func(int, int) int
    best = func(i, m int) int {
        if i >= n {
            return 0
        }
        if memo[i][m] != -1 {
            return memo[i][m]
        }
        answer := 0
        maxX := 2 * m
        if maxX > n-i {
            maxX = n - i
        }
        for x := 1; x <= maxX; x++ {
            nextM := m
            if x > nextM {
                nextM = x
            }
            val := suffix[i] - best(i+x, nextM)
            if val > answer {
                answer = val
            }
        }
        memo[i][m] = answer
        return answer
    }
    
    return best(0, 1)
}
