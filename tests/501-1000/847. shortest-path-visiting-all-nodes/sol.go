func shortestPathLength(graph [][]int) int {
    n := len(graph)
    if n == 1 {
        return 0
    }
    
    FULL := (1 << n) - 1
    visited := make([][]bool, n)
    for i := range visited {
        visited[i] = make([]bool, 1<<n)
    }
    
    type state struct {
        node, mask, dist int
    }
    q := make([]state, 0)
    
    for i := 0; i < n; i++ {
        mask := 1 << i
        q = append(q, state{i, mask, 0})
        visited[i][mask] = true
    }
    
    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        
        if cur.mask == FULL {
            return cur.dist
        }
        
        for _, nei := range graph[cur.node] {
            newMask := cur.mask | (1 << nei)
            
            if !visited[nei][newMask] {
                visited[nei][newMask] = true
                q = append(q, state{nei, newMask, cur.dist + 1})
            }
        }
    }
    
    return -1
}
