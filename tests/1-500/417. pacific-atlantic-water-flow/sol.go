func pacificAtlantic(heights [][]int) [][]int {
    if len(heights) == 0 {
        return [][]int{}
    }
    m, n := len(heights), len(heights[0])
    directions := [][]int{{1,0}, {-1,0}, {0,1}, {0,-1}}
    
    pacific := make([][]bool, m)
    atlantic := make([][]bool, m)
    for i := 0; i < m; i++ {
        pacific[i] = make([]bool, n)
        atlantic[i] = make([]bool, n)
    }
    
    var dfs func(int, int, [][]bool)
    dfs = func(i, j int, visited [][]bool) {
        visited[i][j] = true
        for _, d := range directions {
            x, y := i+d[0], j+d[1]
            if x >= 0 && x < m && y >= 0 && y < n && !visited[x][y] && heights[x][y] >= heights[i][j] {
                dfs(x, y, visited)
            }
        }
    }
    
    for j := 0; j < n; j++ { dfs(0, j, pacific) }
    for i := 0; i < m; i++ { dfs(i, 0, pacific) }
    for j := 0; j < n; j++ { dfs(m-1, j, atlantic) }
    for i := 0; i < m; i++ { dfs(i, n-1, atlantic) }
    
    var result [][]int
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if pacific[i][j] && atlantic[i][j] {
                result = append(result, []int{i, j})
            }
        }
    }
    return result
}
