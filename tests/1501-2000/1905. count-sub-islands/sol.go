func countSubIslands(grid1 [][]int, grid2 [][]int) int {
    m, n := len(grid1), len(grid1[0])
    var dfs func(i, j int, valid *bool)
    dfs = func(i, j int, valid *bool) {
        if i < 0 || i >= m || j < 0 || j >= n {
            return
        }
        if grid2[i][j] == 0 {
            return
        }
        if grid1[i][j] == 0 {
            *valid = false
        }
        grid2[i][j] = 0
        dfs(i+1, j, valid)
        dfs(i-1, j, valid)
        dfs(i, j+1, valid)
        dfs(i, j-1, valid)
    }
    res := 0
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid2[i][j] == 1 {
                valid := true
                dfs(i, j, &valid)
                if valid {
                    res++
                }
            }
        }
    }
    return res
}
