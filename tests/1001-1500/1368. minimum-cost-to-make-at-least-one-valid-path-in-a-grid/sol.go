func minCost(grid [][]int) int {
    m := len(grid)
    n := len(grid[0])
    minCost := make([][]int, m)
    for i := range minCost {
        minCost[i] = make([]int, n)
        for j := range minCost[i] {
            minCost[i][j] = int(^uint(0) >> 1)
        }
    }
    minCost[0][0] = 0
    
    type pair struct{ r, c int }
    var deque []pair
    deque = append(deque, pair{0, 0})
    
    directions := [][]int{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}
    
    for len(deque) > 0 {
        curr := deque[0]
        deque = deque[1:]
        r, c := curr.r, curr.c
        
        for i, dir := range directions {
            nr, nc := r+dir[0], c+dir[1]
            cost := 1
            if grid[r][c] == i+1 {
                cost = 0
            }
            
            if nr >= 0 && nr < m && nc >= 0 && nc < n && minCost[r][c]+cost < minCost[nr][nc] {
                minCost[nr][nc] = minCost[r][c] + cost
                
                if cost == 1 {
                    deque = append(deque, pair{nr, nc})
                } else {
                    deque = append([]pair{{nr, nc}}, deque...)
                }
            }
        }
    }
    
    return minCost[m-1][n-1]
}
