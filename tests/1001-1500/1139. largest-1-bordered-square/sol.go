func largest1BorderedSquare(grid [][]int) int {
    m, n := len(grid), len(grid[0])
    h := make([][]int, m)
    v := make([][]int, m)
    for i := 0; i < m; i++ {
        h[i] = make([]int, n)
        v[i] = make([]int, n)
    }
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 1 {
                if j == 0 {
                    h[i][j] = 1
                } else {
                    h[i][j] = h[i][j-1] + 1
                }
                if i == 0 {
                    v[i][j] = 1
                } else {
                    v[i][j] = v[i-1][j] + 1
                }
            }
        }
    }
    ans := 0
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            sz := h[i][j]
            if v[i][j] < sz {
                sz = v[i][j]
            }
            for k := sz; k >= 1; k-- {
                if h[i-k+1][j] >= k && v[i][j-k+1] >= k {
                    if k > ans {
                        ans = k
                    }
                    break
                }
            }
        }
    }
    return ans * ans
}
