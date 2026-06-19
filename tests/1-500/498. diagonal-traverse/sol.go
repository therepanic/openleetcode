func findDiagonalOrder(mat [][]int) []int {
    if len(mat) == 0 || len(mat[0]) == 0 {
        return []int{}
    }
    
    m, n := len(mat), len(mat[0])
    result := make([]int, 0, m*n)
    row, col := 0, 0
    
    for i := 0; i < m*n; i++ {
        result = append(result, mat[row][col])
        
        if (row+col)%2 == 0 {
            if col == n-1 {
                row++
            } else if row == 0 {
                col++
            } else {
                row--
                col++
            }
        } else {
            if row == m-1 {
                col++
            } else if col == 0 {
                row++
            } else {
                row++
                col--
            }
        }
    }
    
    return result
}
