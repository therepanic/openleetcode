func uniquePathsIII(grid [][]int) int {
    m, n := len(grid), len(grid[0])
    sx, sy := -1, -1
    count := 0
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 0 {
                count++
            }
            if grid[i][j] == 1 {
                sx, sy = i, j
            }
        }
    }
    
    var backtrack func(int, int, int) int
    backtrack = func(i, j, count int) int {
        result := 0
        dirs := [][]int{{i-1, j}, {i+1, j}, {i, j-1}, {i, j+1}}
        for _, d := range dirs {
            x, y := d[0], d[1]
            if x < 0 || x >= m || y < 0 || y >= n {
                continue
            }
            if grid[x][y] == 2 {
                if count == 0 {
                    result++
                }
            } else if grid[x][y] == 0 {
                grid[x][y] = -1
                result += backtrack(x, y, count-1)
                grid[x][y] = 0
            }
        }
        return result
    }
    
    return backtrack(sx, sy, count)
}
