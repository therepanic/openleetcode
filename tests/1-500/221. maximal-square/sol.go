func maximalSquare(matrix [][]string) int {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return 0
    }
    Rows := len(matrix)
    Cols := len(matrix[0])
    maxArea := 0
    dp := make([][]int, Rows)
    for i := range dp {
        dp[i] = make([]int, Cols)
    }

    for r := Rows - 1; r >= 0; r-- {
        for c := Cols - 1; c >= 0; c-- {
            if matrix[r][c] == "1" {
                down := 0
                right := 0
                diag := 0
                if r+1 < Rows {
                    down = dp[r+1][c]
                }
                if c+1 < Cols {
                    right = dp[r][c+1]
                }
                if r+1 < Rows && c+1 < Cols {
                    diag = dp[r+1][c+1]
                }
                dp[r][c] = 1 + min(down, min(right, diag))
            } else {
                dp[r][c] = 0
            }
            if dp[r][c] > maxArea {
                maxArea = dp[r][c]
            }
        }
    }
    return maxArea * maxArea
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
