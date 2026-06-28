func imageSmoother(img [][]int) [][]int {
    m := len(img)
    n := len(img[0])
    P := make([][]int, m+1)
    for i := range P {
        P[i] = make([]int, n+1)
    }
    for i := 1; i <= m; i++ {
        for j := 1; j <= n; j++ {
            P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1]
        }
    }
    res := make([][]int, m)
    for i := range res {
        res[i] = make([]int, n)
    }
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            a := max(0, i-1)
            b := max(0, j-1)
            c := min(m-1, i+1)
            d := min(n-1, j+1)
            s := P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b]
            res[i][j] = s / ((c - a + 1) * (d - b + 1))
        }
    }
    return res
}
