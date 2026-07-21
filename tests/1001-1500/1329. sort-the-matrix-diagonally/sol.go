func diagonalSort(mat [][]int) [][]int {
    m, n := len(mat), len(mat[0])
    diagonals := make(map[int][]int)
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            key := i - j
            diagonals[key] = append(diagonals[key], mat[i][j])
        }
    }
    
    for key := range diagonals {
        sort.Slice(diagonals[key], func(a, b int) bool {
            return diagonals[key][a] > diagonals[key][b]
        })
    }
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            key := i - j
            list := diagonals[key]
            mat[i][j] = list[len(list)-1]
            diagonals[key] = list[:len(list)-1]
        }
    }
    
    return mat
}
