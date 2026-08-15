func largestSubmatrix(matrix [][]int) int {
    m := len(matrix)
    n := len(matrix[0])
    maxArea := 0
    h := make([]int, n)
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if j < len(matrix[i]) && matrix[i][j] == 1 {
                h[j]++
            } else {
                h[j] = 0
            }
        }
        sh := make([]int, n)
        copy(sh, h)
        sort.Sort(sort.Reverse(sort.IntSlice(sh)))
        for j := 0; j < n; j++ {
            if sh[j] == 0 {
                break
            }
            if sh[j]*(j+1) > maxArea {
                maxArea = sh[j] * (j + 1)
            }
        }
    }
    return maxArea
}
