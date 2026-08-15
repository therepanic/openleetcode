func findFarmland(land [][]int) [][]int {
    n := len(land)
    m := len(land[0])
    visited := make([][]bool, n)
    for i := range visited {
        visited[i] = make([]bool, m)
    }
    directions := [][]int{{-1,0},{0,1},{1,0},{0,-1}}
    
    maxr := []int{0}
    maxc := []int{0}
    
    var dfs func(r, c int)
    dfs = func(r, c int) {
        visited[r][c] = true
        if r > maxr[0] { maxr[0] = r }
        if c > maxc[0] { maxc[0] = c }
        for _, d := range directions {
            nr, nc := r + d[0], c + d[1]
            if nr >= 0 && nr < n && nc >= 0 && nc < m {
                if !visited[nr][nc] && land[nr][nc] == 1 {
                    dfs(nr, nc)
                }
            }
        }
    }
    
    res := make([][]int, 0)
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            if land[i][j] == 1 && !visited[i][j] {
                maxr[0] = i
                maxc[0] = j
                dfs(i, j)
                res = append(res, []int{i, j, maxr[0], maxc[0]})
            }
        }
    }
    return res
}
