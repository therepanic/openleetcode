func matrixBlockSum(mat [][]int, k int) [][]int {
    n, m := len(mat), len(mat[0])
    pre := make([][]int, n)
    ans := make([][]int, n)
    for i := 0; i < n; i++ {
        pre[i] = make([]int, m)
        ans[i] = make([]int, m)
    }
    
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            sum := mat[i][j]
            if i-1 >= 0 {
                sum += pre[i-1][j]
            }
            if j-1 >= 0 {
                sum += pre[i][j-1]
            }
            if i-1 >= 0 && j-1 >= 0 {
                sum -= pre[i-1][j-1]
            }
            pre[i][j] = sum
        }
    }
    
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            i1 := max(0, i-k)
            i2 := min(n-1, i+k)
            j1 := max(0, j-k)
            j2 := min(m-1, j+k)
            sum := pre[i2][j2]
            if i1-1 >= 0 {
                sum -= pre[i1-1][j2]
            }
            if j1-1 >= 0 {
                sum -= pre[i2][j1-1]
            }
            if i1-1 >= 0 && j1-1 >= 0 {
                sum += pre[i1-1][j1-1]
            }
            ans[i][j] = sum
        }
    }
    return ans
}
