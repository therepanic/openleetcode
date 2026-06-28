func maxAreaOfIsland(grid [][]int) int {
    rows := len(grid)
    cols := len(grid[0])
    visited := make([][]bool, rows)
    for i := range visited {
        visited[i] = make([]bool, cols)
    }
    maxIsland := 0
    
    var dfs func(r, c int) int
    dfs = func(r, c int) int {
        if r < 0 || r >= rows || c < 0 || c >= cols || visited[r][c] || grid[r][c] == 0 {
            return 0
        }
        
        visited[r][c] = true
        
        return 1 + dfs(r+1, c) + dfs(r-1, c) + dfs(r, c+1) + dfs(r, c-1)
    }
    
    for r := 0; r < rows; r++ {
        for c := 0; c < cols; c++ {
            if grid[r][c] == 1 && !visited[r][c] {
                area := dfs(r, c)
                if area > maxIsland {
                    maxIsland = area
                }
            }
        }
    }
    
    return maxIsland
}
