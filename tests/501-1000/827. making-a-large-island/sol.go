func largestIsland(grid [][]int) int {
    r := len(grid)
    c := len(grid[0])
    dirs := [][]int{{1, 0}, {0, 1}, {-1, 0}, {0, -1}}
    island := 2
    a := make(map[int]int)
    
    var dfs func(int, int, int) int
    dfs = func(i, j, x int) int {
        tot := 1
        grid[i][j] = x
        for _, d := range dirs {
            nx, ny := i+d[0], j+d[1]
            if nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1 {
                tot += dfs(nx, ny, x)
            }
        }
        return tot
    }
    
    for i := 0; i < r; i++ {
        for j := 0; j < c; j++ {
            if grid[i][j] == 1 {
                a[island] = dfs(i, j, island)
                island++
            }
        }
    }
    
    res := 0
    for i := 0; i < r; i++ {
        for j := 0; j < c; j++ {
            if grid[i][j] == 0 {
                y := make(map[int]bool)
                for _, d := range dirs {
                    nx, ny := i+d[0], j+d[1]
                    if nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0 {
                        y[grid[nx][ny]] = true
                    }
                }
                tot := 1
                for b := range y {
                    tot += a[b]
                }
                if tot > res {
                    res = tot
                }
            }
        }
    }
    
    if val, ok := a[2]; ok && val > res {
        return val
    }
    return res
}
