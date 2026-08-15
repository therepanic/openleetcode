func containsCycle(grid [][]byte) bool {
    n := len(grid)
    m := len(grid[0])
    visited := make([][]bool, n)
    for i := range visited {
        visited[i] = make([]bool, m)
    }
    
    directions := [][]int{{-1,0}, {1,0}, {0,-1}, {0,1}}
    
    type cell struct { x, y, px, py int }
    
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            if !visited[i][j] {
                queue := []cell{{i, j, -1, -1}}
                visited[i][j] = true
                head := 0
                for head < len(queue) {
                    cur := queue[head]
                    head++
                    x, y, px, py := cur.x, cur.y, cur.px, cur.py
                    for _, d := range directions {
                        nx, ny := x + d[0], y + d[1]
                        if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
                        if grid[nx][ny] != grid[x][y] { continue }
                        if nx == px && ny == py { continue }
                        if visited[nx][ny] { return true }
                        visited[nx][ny] = true
                        queue = append(queue, cell{nx, ny, x, y})
                    }
                }
            }
        }
    }
    return false
}
