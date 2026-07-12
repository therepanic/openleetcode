func minFallingPathSum(matrix [][]int) int {
    m := len(matrix)
    n := len(matrix[0])
    if m == 1 && n == 1 {
        minVal := matrix[0][0]
        for _, v := range matrix[0] {
            if v < minVal {
                minVal = v
            }
        }
        return minVal
    }
    dp := make([][]*int, m-1)
    for i := range dp {
        dp[i] = make([]*int, n)
    }
    mini := int(1<<31 - 1)
    var f func(int, int) int
    f = func(i, j int) int {
        if j >= n || j < 0 {
            return 1<<31 - 1
        }
        if i == m-1 {
            return matrix[i][j]
        }
        if dp[i][j] != nil {
            return *dp[i][j]
        }
        down := matrix[i][j] + f(i+1, j)
        leftd := matrix[i][j] + f(i+1, j-1)
        rightd := matrix[i][j] + f(i+1, j+1)
        minVal := down
        if leftd < minVal {
            minVal = leftd
        }
        if rightd < minVal {
            minVal = rightd
        }
        dp[i][j] = &minVal
        return minVal
    }
    for i := 0; i < n; i++ {
        val := f(0, i)
        if val < mini {
            mini = val
        }
    }
    return mini
}
