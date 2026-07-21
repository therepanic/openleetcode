func countSquares(matrix [][]int) int {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return 0
    }
    
    m, n := len(matrix), len(matrix[0])
    res := 0
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if matrix[i][j] == 1 && i > 0 && j > 0 {
                matrix[i][j] = min(
                    min(matrix[i-1][j], matrix[i][j-1]),
                    matrix[i-1][j-1],
                ) + 1
            }
            res += matrix[i][j]
        }
    }
    
    return res
}
