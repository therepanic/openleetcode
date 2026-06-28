func matrixReshape(mat [][]int, r int, c int) [][]int {
    m := len(mat)
    n := len(mat[0])
    if m*n != r*c {
        return mat
    }
    
    reshaped := make([][]int, r)
    for i := range reshaped {
        reshaped[i] = make([]int, c)
    }
    count := 0
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            reshaped[count/c][count%c] = mat[i][j]
            count++
        }
    }
    
    return reshaped
}
