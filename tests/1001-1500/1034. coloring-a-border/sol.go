func colorBorder(grid [][]int, row int, col int, color int) [][]int {
    rows := len(grid)
    cols := len(grid[0])
    startColor := grid[row][col]
    
    if startColor == color {
        return grid
    }
    
    queue := [][]int{{row, col}}
    visited := make([][]bool, rows)
    for i := range visited {
        visited[i] = make([]bool, cols)
    }
    visited[row][col] = true
    borders := [][]int{}
    
    dirs := [][]int{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}
    
    for len(queue) > 0 {
        cur := queue[0]
        queue = queue[1:]
        r, c := cur[0], cur[1]
        isBorder := false
        
        for _, dir := range dirs {
            nr, nc := r + dir[0], c + dir[1]
            
            if nr < 0 || nr >= rows || nc < 0 || nc >= cols {
                isBorder = true
            } else if grid[nr][nc] != startColor {
                isBorder = true
            } else if !visited[nr][nc] {
                visited[nr][nc] = true
                queue = append(queue, []int{nr, nc})
            }
        }
        
        if isBorder {
            borders = append(borders, []int{r, c})
        }
    }
    
    for _, cell := range borders {
        grid[cell[0]][cell[1]] = color
    }
    
    return grid
}
