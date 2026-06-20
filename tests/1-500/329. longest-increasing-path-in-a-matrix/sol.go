func longestIncreasingPath(matrix [][]int) int {
    row := len(matrix)
    col := len(matrix[0])
    dp := make([][]int, row)
    for i := range dp {
        dp[i] = make([]int, col)
    }
    
    var graph func(i, j int) int
    graph = func(i, j int) int {
        if dp[i][j] != 0 {
            return dp[i][j]
        }
        
        top := 0
        down := 0
        left := 0
        right := 0
        
        if i-1 >= 0 && matrix[i-1][j] > matrix[i][j] {
            if dp[i-1][j] == 0 {
                dp[i-1][j] = graph(i-1, j)
            }
            top = dp[i-1][j]
        }
        
        if i+1 < row && matrix[i+1][j] > matrix[i][j] {
            if dp[i+1][j] == 0 {
                dp[i+1][j] = graph(i+1, j)
            }
            down = dp[i+1][j]
        }
        
        if j-1 >= 0 && matrix[i][j-1] > matrix[i][j] {
            if dp[i][j-1] == 0 {
                dp[i][j-1] = graph(i, j-1)
            }
            left = dp[i][j-1]
        }
        
        if j+1 < col && matrix[i][j+1] > matrix[i][j] {
            if dp[i][j+1] == 0 {
                dp[i][j+1] = graph(i, j+1)
            }
            right = dp[i][j+1]
        }
        
        dp[i][j] = 1 + max(max(top, down), max(left, right))
        return dp[i][j]
    }
    
    maxi := 0
    for i := 0; i < row; i++ {
        for j := 0; j < col; j++ {
            num := graph(i, j)
            if num > maxi {
                maxi = num
            }
        }
    }
    
    return maxi
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
