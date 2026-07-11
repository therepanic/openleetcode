func shortestBridge(grid [][]int) int {
    n := len(grid)
    directions := [][]int{{-1, 0}, {1, 0}, {0, 1}, {0, -1}}
    visited := make([][]bool, n)
    for i := range visited {
        visited[i] = make([]bool, n)
    }
    type point struct{ r, c, dist int }
    q := make([]point, 0)
    
    var dfs func(r, c int)
    dfs = func(r, c int) {
        visited[r][c] = true
        for _, d := range directions {
            nr, nc := r+d[0], c+d[1]
            if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                if grid[nr][nc] == 0 {
                    visited[nr][nc] = true
                    q = append(q, point{nr, nc, 1})
                } else {
                    dfs(nr, nc)
                }
            }
        }
    }
    
    found := false
    for i := 0; i < n && !found; i++ {
        for j := 0; j < n && !found; j++ {
            if grid[i][j] == 1 {
                dfs(i, j)
                found = true
            }
        }
    }
    
    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        for _, d := range directions {
            nr, nc := cur.r+d[0], cur.c+d[1]
            if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                if grid[nr][nc] == 1 {
                    return cur.dist
                }
                visited[nr][nc] = true
                q = append(q, point{nr, nc, cur.dist + 1})
            }
        }
    }
    return 0
}
