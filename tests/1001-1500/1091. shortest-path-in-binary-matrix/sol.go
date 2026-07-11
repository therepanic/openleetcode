func shortestPathBinaryMatrix(grid [][]int) int {
    n := len(grid)
    
    if grid[0][0] == 1 || grid[n-1][n-1] == 1 {
        return -1
    }
    
    if n == 1 {
        return 1
    }
    
    dist := make([][]int, n)
    for i := 0; i < n; i++ {
        dist[i] = make([]int, n)
        for j := 0; j < n; j++ {
            dist[i][j] = int(^uint(0) >> 1)
        }
    }
    dist[0][0] = 1
    
    type Node struct {
        r, c, dis int
    }
    q := []Node{{0, 0, 1}}
    
    directions := [][]int{
        {-1, 0}, {-1, -1}, {0, 1}, {-1, 1},
        {1, 0}, {1, -1}, {0, -1}, {1, 1},
    }
    
    for len(q) > 0 {
        curr := q[0]
        q = q[1:]
        r, c, dis := curr.r, curr.c, curr.dis
        
        for _, dir := range directions {
            nr, nc := r+dir[0], c+dir[1]
            
            if nr >= 0 && nr < n && nc >= 0 && nc < n &&
                grid[nr][nc] == 0 && dis+1 < dist[nr][nc] {
                
                dist[nr][nc] = dis + 1
                
                if nr == n-1 && nc == n-1 {
                    return dis + 1
                }
                
                q = append(q, Node{nr, nc, dis + 1})
            }
        }
    }
    
    return -1
}
