func minDays(grid [][]int) int {
    countIslands := func() int {
        seen := make([][]bool, len(grid))
        for i := range seen {
            seen[i] = make([]bool, len(grid[0]))
        }
        islands := 0
        dirs := [][]int{{-1,0},{1,0},{0,-1},{0,1}}
        
        for i := 0; i < len(grid); i++ {
            for j := 0; j < len(grid[0]); j++ {
                if grid[i][j] == 1 && !seen[i][j] {
                    islands++
                    stack := [][]int{{i, j}}
                    seen[i][j] = true
                    for len(stack) > 0 {
                        cell := stack[len(stack)-1]
                        stack = stack[:len(stack)-1]
                        for _, d := range dirs {
                            nx, ny := cell[0]+d[0], cell[1]+d[1]
                            if nx >= 0 && nx < len(grid) && ny >= 0 && ny < len(grid[0]) && grid[nx][ny] == 1 && !seen[nx][ny] {
                                seen[nx][ny] = true
                                stack = append(stack, []int{nx, ny})
                            }
                        }
                    }
                }
            }
        }
        return islands
    }
    
    if countIslands() != 1 {
        return 0
    }
    
    for i := 0; i < len(grid); i++ {
        for j := 0; j < len(grid[0]); j++ {
            if grid[i][j] == 1 {
                grid[i][j] = 0
                if countIslands() != 1 {
                    return 1
                }
                grid[i][j] = 1
            }
        }
    }
    return 2
}
