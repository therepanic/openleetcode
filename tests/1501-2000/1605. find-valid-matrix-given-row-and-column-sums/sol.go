func restoreMatrix(rowSum []int, colSum []int) [][]int {
    m, n := len(rowSum), len(colSum)
    matrix := make([][]int, m)
    for i := range matrix {
        matrix[i] = make([]int, n)
    }
    i, j := 0, 0
    for i < m && j < n {
        val := min(rowSum[i], colSum[j])
        matrix[i][j] = val
        rowSum[i] -= val
        colSum[j] -= val
        if rowSum[i] == 0 {
            i++
        }
        if colSum[j] == 0 {
            j++
        }
    }
    return matrix
}
