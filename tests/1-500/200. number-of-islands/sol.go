func numIslands(grid [][]string) int {
    rows := len(grid)
    cols := len(grid[0])
    islands := 0
    directions := [][2]int{{1, 0}, {-1, 0}, {0, 1}, {0, -1}}

    for r := 0; r < rows; r++ {
        for c := 0; c < cols; c++ {
            if grid[r][c] != "1" {
                continue
            }
            islands++
            queue := [][2]int{{r, c}}
            grid[r][c] = "0"
            for len(queue) > 0 {
                cell := queue[0]
                queue = queue[1:]
                for _, d := range directions {
                    nr := cell[0] + d[0]
                    nc := cell[1] + d[1]
                    if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == "1" {
                        grid[nr][nc] = "0"
                        queue = append(queue, [2]int{nr, nc})
                    }
                }
            }
        }
    }

    return islands
}
