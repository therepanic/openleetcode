func canMouseWin(grid []string, catJump int, mouseJump int) bool {
    m, n := len(grid), len(grid[0])
    walls := make(map[int]bool)
    var food, cat, mouse int
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            idx := i*n + j
            switch grid[i][j] {
            case 'F':
                food = idx
            case 'C':
                cat = idx
            case 'M':
                mouse = idx
            case '#':
                walls[idx] = true
            }
        }
    }
    
    dirs := [][]int{{-1,0},{0,1},{1,0},{0,-1}}
    memo := make(map[int]bool)
    maxTurns := m*n*2
    
    var dfs func(c, mo, turn int) bool
    dfs = func(c, mo, turn int) bool {
        key := (c*m*n + mo)*maxTurns + turn
        if val, ok := memo[key]; ok {
            return val
        }
        
        if c == food || c == mo || turn >= maxTurns {
            memo[key] = false
            return false
        }
        if mo == food {
            memo[key] = true
            return true
        }
        
        var result bool
        if turn%2 == 0 {  // mouse turn
            result = false
            mx, my := mo/n, mo%n
        mouseOuter:
            for _, d := range dirs {
                for jump := 0; jump <= mouseJump; jump++ {
                    nx, ny := mx+jump*d[0], my+jump*d[1]
                    if nx < 0 || nx >= m || ny < 0 || ny >= n || walls[nx*n+ny] {
                        break
                    }
                    if dfs(c, nx*n+ny, turn+1) {
                        result = true
                        break mouseOuter
                    }
                }
            }
        } else {  // cat turn
            result = true
            cx, cy := c/n, c%n
        catOuter:
            for _, d := range dirs {
                for jump := 0; jump <= catJump; jump++ {
                    nx, ny := cx+jump*d[0], cy+jump*d[1]
                    if nx < 0 || nx >= m || ny < 0 || ny >= n || walls[nx*n+ny] {
                        break
                    }
                    if !dfs(nx*n+ny, mo, turn+1) {
                        result = false
                        break catOuter
                    }
                }
            }
        }
        
        memo[key] = result
        return result
    }
    
    return dfs(cat, mouse, 0)
}
