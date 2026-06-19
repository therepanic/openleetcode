func islandPerimeter(grid [][]int) int {
    rows := len(grid)
    cols := len(grid[0])
    visited := make(map[[2]int]bool)
    
    var start [2]int
    found := false
    for r := 0; r < rows; r++ {
        for c := 0; c < cols; c++ {
            if grid[r][c] == 1 {
                start = [2]int{r, c}
                found = true
                break
            }
        }
        if found {
            break
        }
    }
    
    queue := [][2]int{start}
    visited[start] = true
    perimeter := 0
    
    dirs := [][2]int{{-1,0},{1,0},{0,-1},{0,1}}
    
    for len(queue) > 0 {
        curr := queue[0]
        queue = queue[1:]
        r, c := curr[0], curr[1]
        
        for _, dir := range dirs {
            nr, nc := r + dir[0], c + dir[1]
            
            if nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0 {
                perimeter++
            } else if !visited[[2]int{nr, nc}] {
                visited[[2]int{nr, nc}] = true
                queue = append(queue, [2]int{nr, nc})
            }
        }
    }
    
    return perimeter
}
