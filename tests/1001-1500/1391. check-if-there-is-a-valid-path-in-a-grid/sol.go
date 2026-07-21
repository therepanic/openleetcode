func hasValidPath(grid [][]int) bool {
    m := len(grid)
    n := len(grid[0])
    
    dir := map[int][][]int{
        1: {{0, -1}, {0, 1}},
        2: {{-1, 0}, {1, 0}},
        3: {{0, -1}, {1, 0}},
        4: {{0, 1}, {1, 0}},
        5: {{0, -1}, {-1, 0}},
        6: {{0, 1}, {-1, 0}},
    }
    
    vis := make([][]bool, m)
    for i := range vis {
        vis[i] = make([]bool, n)
    }
    
    q := [][]int{{0, 0}}
    vis[0][0] = true
    
    for len(q) > 0 {
        r, c := q[0][0], q[0][1]
        q = q[1:]
        
        if r == m-1 && c == n-1 {
            return true
        }
        
        for _, d := range dir[grid[r][c]] {
            nr, nc := r+d[0], c+d[1]
            
            if nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc] {
                continue
            }
            
            for _, bd := range dir[grid[nr][nc]] {
                if nr+bd[0] == r && nc+bd[1] == c {
                    vis[nr][nc] = true
                    q = append(q, []int{nr, nc})
                }
            }
        }
    }
    
    return false
}
