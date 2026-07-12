func transpose(matrix [][]int) [][]int {
    row := len(matrix)
    col := len(matrix[0])
    trans := make([][]int, col)
    for i := range trans {
        trans[i] = make([]int, row)
    }

    for i := 0; i < col; i++ {
        for j := 0; j < row; j++ {
            trans[i][j] = matrix[j][i]
        }
    }

    return trans
}
