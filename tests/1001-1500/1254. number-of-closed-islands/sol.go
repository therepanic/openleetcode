func closedIsland(grid [][]int) int {
    m, n := len(grid), len(grid[0])
    res := 0
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 1 {
                continue
            }
            stack := [][]int{{i, j}}
            grid[i][j] = 1
            closed := true
            for len(stack) > 0 {
                cur := stack[len(stack)-1]
                stack = stack[:len(stack)-1]
                r, c := cur[0], cur[1]
                if r == 0 || c == 0 || r == m-1 || c == n-1 {
                    closed = false
                }
                dirs := [][]int{{1, 0}, {-1, 0}, {0, 1}, {0, -1}}
                for _, d := range dirs {
                    nr, nc := r+d[0], c+d[1]
                    if nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0 {
                        grid[nr][nc] = 1
                        stack = append(stack, []int{nr, nc})
                    }
                }
            }
            if closed {
                res++
            }
        }
    }
    return res
}
