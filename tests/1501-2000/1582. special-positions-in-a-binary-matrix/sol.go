func numSpecial(mat [][]int) int {
    m, n := len(mat), len(mat[0])
    row := make([]int, m)
    col := make([]int, n)

    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if mat[i][j] == 1 {
                row[i]++
                col[j]++
            }
        }
    }

    result := 0
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if mat[i][j] == 1 && row[i] == 1 && col[j] == 1 {
                result++
            }
        }
    }
    return result
}
