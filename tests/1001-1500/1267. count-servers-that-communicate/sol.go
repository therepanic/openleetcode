func countServers(grid [][]int) int {
    m := len(grid)
    n := len(grid[0])
    rowCounts := make([]int, m)
    colCounts := make([]int, n)
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 1 {
                rowCounts[i]++
                colCounts[j]++
            }
        }
    }
    result := 0
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 1 && (rowCounts[i] > 1 || colCounts[j] > 1) {
                result++
            }
        }
    }
    return result
}
