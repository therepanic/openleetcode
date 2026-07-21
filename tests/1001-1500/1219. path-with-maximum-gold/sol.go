func getMaximumGold(grid [][]int) int {
    n := len(grid)
    m := len(grid[0])
    
    visited := make([][]bool, n)
    for i := range visited {
        visited[i] = make([]bool, m)
    }
    
    directions := [][]int{{-1, 0}, {0, 1}, {1, 0}, {0, -1}}
    
    var dfs func(r, c int) int
    dfs = func(r, c int) int {
        total := grid[r][c]
        visited[r][c] = true
        
        curr := 0
        for _, dir := range directions {
            nr, nc := r+dir[0], c+dir[1]
            if nr >= 0 && nr < n && nc >= 0 && nc < m {
                if grid[nr][nc] != 0 && !visited[nr][nc] {
                    a := dfs(nr, nc)
                    if a > curr {
                        curr = a
                    }
                }
            }
        }
        total += curr
        visited[r][c] = false
        return total
    }
    
    ans := 0
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            if !visited[i][j] && grid[i][j] != 0 {
                res := dfs(i, j)
                if res > ans {
                    ans = res
                }
            }
        }
    }
    return ans
}
