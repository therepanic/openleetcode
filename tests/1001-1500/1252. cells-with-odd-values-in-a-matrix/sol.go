func oddCells(m int, n int, indices [][]int) int {
    a := make([][]int, m)
    for i := 0; i < m; i++ {
        a[i] = make([]int, n)
    }
    c := 0
    for _, k := range indices {
        for u := 0; u < n; u++ {
            a[k[0]][u]++
        }
        for l := 0; l < m; l++ {
            a[l][k[1]]++
        }
    }
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if a[i][j] % 2 != 0 {
                c++
            }
        }
    }
    return c
}
