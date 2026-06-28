func isToeplitzMatrix(matrix [][]int) bool {
    n := len(matrix)
    m := len(matrix[0])
    
    for i := 0; i < n - 1; i++ {
        for j := 0; j < m - 1; j++ {
            if matrix[i][j] != matrix[i + 1][j + 1] {
                return false
            }
        }
    }
    
    return true
}
