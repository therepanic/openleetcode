func shortestPathAllKeys(grid []string) int {
    m := len(grid)
    n := len(grid[0])
    start_i, start_j := 0, 0
    total_keys := 0
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == '@' {
                start_i = i
                start_j = j
            }
            if grid[i][j] >= 'a' && grid[i][j] <= 'f' {
                total_keys++
            }
        }
    }
    
    target_mask := (1 << total_keys) - 1
    type State struct {
        i, j, mask int
    }
    queue := []State{{start_i, start_j, 0}}
    seen := make([][][]bool, m)
    for i := 0; i < m; i++ {
        seen[i] = make([][]bool, n)
        for j := 0; j < n; j++ {
            seen[i][j] = make([]bool, 1<<total_keys)
        }
    }
    seen[start_i][start_j][0] = true
    moves := 0
    dirs := [][]int{{0,1}, {0,-1}, {1,0}, {-1,0}}
    
    for len(queue) > 0 {
        size := len(queue)
        for k := 0; k < size; k++ {
            r := queue[0].i
            c := queue[0].j
            mask := queue[0].mask
            queue = queue[1:]
            
            if mask == target_mask {
                return moves
            }
            
            for _, dir := range dirs {
                nr := r + dir[0]
                nc := c + dir[1]
                
                if nr < 0 || nr >= m || nc < 0 || nc >= n {
                    continue
                }
                
                next_val := grid[nr][nc]
                next_mask := mask
                
                if next_val >= 'a' && next_val <= 'f' {
                    key_bit := int(next_val - 'a')
                    next_mask |= (1 << key_bit)
                }
                
                if next_val >= 'A' && next_val <= 'F' {
                    lock_bit := int(next_val - 'A')
                    if (next_mask & (1 << lock_bit)) == 0 {
                        continue
                    }
                }
                
                if !seen[nr][nc][next_mask] && next_val != '#' {
                    queue = append(queue, State{nr, nc, next_mask})
                    seen[nr][nc][next_mask] = true
                }
            }
        }
        moves++
    }
    
    return -1
}
