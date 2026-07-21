func maxDistance(grid [][]int) int {
    if len(grid) == 0 || len(grid[0]) == 0 {
        return -1
    }
    
    n := len(grid)
    type point struct{ r, c int }
    frontier := make([]point, 0)
    
    for r := 0; r < n; r++ {
        for c := 0; c < n; c++ {
            if grid[r][c] == 1 {
                frontier = append(frontier, point{r, c})
            }
        }
    }
    
    if len(frontier) == 0 || len(frontier) == n*n {
        return -1
    }
    
    directions := [][2]int{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}
    distance := -1
    
    for len(frontier) > 0 {
        nextFrontier := make([]point, 0)
        distance++
        
        for _, p := range frontier {
            for _, dir := range directions {
                nr, nc := p.r+dir[0], p.c+dir[1]
                
                if nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0 {
                    grid[nr][nc] = 1
                    nextFrontier = append(nextFrontier, point{nr, nc})
                }
            }
        }
        
        frontier = nextFrontier
    }
    
    return distance
}
