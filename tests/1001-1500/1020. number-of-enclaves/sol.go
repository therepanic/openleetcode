func numEnclaves(grid [][]int) int {
    total := 0
    for _, row := range grid {
        for _, val := range row {
            total += val
        }
    }
    
    m, n := len(grid), len(grid[0])
    if m == 1 || n == 1 {
        return 0
    }
    
    type pair struct{ x, y int }
    q := []pair{}
    seen := make(map[pair]bool)
    
    for i := 0; i < n; i++ {
        if grid[0][i] == 1 {
            p := pair{0, i}
            q = append(q, p)
            seen[p] = true
        }
        if grid[m-1][i] == 1 {
            p := pair{m-1, i}
            q = append(q, p)
            seen[p] = true
        }
    }
    for i := 1; i < m-1; i++ {
        if grid[i][0] == 1 {
            p := pair{i, 0}
            q = append(q, p)
            seen[p] = true
        }
        if grid[i][n-1] == 1 {
            p := pair{i, n-1}
            q = append(q, p)
            seen[p] = true
        }
    }
    
    directions := [][2]int{{0,1},{1,0},{0,-1},{-1,0}}
    nextTotal := 0
    
    for len(q) > 0 {
        curr := q[0]
        q = q[1:]
        nextTotal++
        x, y := curr.x, curr.y
        
        for _, d := range directions {
            nx, ny := x + d[0], y + d[1]
            p := pair{nx, ny}
            if nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && !seen[p] {
                q = append(q, p)
                seen[p] = true
            }
        }
    }
    
    return total - nextTotal
}
