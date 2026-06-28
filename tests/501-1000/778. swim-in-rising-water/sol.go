func swimInWater(grid [][]int) int {
    n := len(grid)
    dirs := [][]int{{0,-1},{0,1},{-1,0},{1,0}}
    
    var dfs func(x, y, t int, vis [][]bool) bool
    dfs = func(x, y, t int, vis [][]bool) bool {
        if x == n-1 && y == n-1 {
            return true
        }
        vis[x][y] = true
        for _, d := range dirs {
            nx, ny := x+d[0], y+d[1]
            if nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t {
                if dfs(nx, ny, t, vis) {
                    return true
                }
            }
        }
        return false
    }
    
    low, high, ans := 0, n*n-1, 1<<31-1
    for low <= high {
        mid := (low + high) / 2
        vis := make([][]bool, n)
        for i := range vis {
            vis[i] = make([]bool, n)
        }
        if grid[0][0] <= mid && dfs(0, 0, mid, vis) {
            ans = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return ans
}
