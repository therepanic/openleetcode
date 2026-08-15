func construct2DArray(original []int, m int, n int) [][]int {
    k := len(original)
    if m*n != k {
        return [][]int{}
    }
    ans := make([][]int, m)
    idx := 0
    for i := 0; i < m; i++ {
        ans[i] = make([]int, n)
        for j := 0; j < n; j++ {
            ans[i][j] = original[idx]
            idx++
        }
    }
    return ans
}
