func nearestExit(maze [][]byte, entrance []int) int {
    n := len(maze)
    m := len(maze[0])
    visited := make([][]bool, n)
    for i := range visited {
        visited[i] = make([]bool, m)
    }
    type cell struct { r, c, dist int }
    q := []cell{{entrance[0], entrance[1], 0}}
    visited[entrance[0]][entrance[1]] = true
    dirs := [][]int{{-1,0},{1,0},{0,-1},{0,1}}
    
    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        for _, d := range dirs {
            nr := cur.r + d[0]
            nc := cur.c + d[1]
            if nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == '.' {
                visited[nr][nc] = true
                if nr == 0 || nc == 0 || nr == n-1 || nc == m-1 {
                    return cur.dist + 1
                }
                q = append(q, cell{nr, nc, cur.dist+1})
            }
        }
    }
    return -1
}
