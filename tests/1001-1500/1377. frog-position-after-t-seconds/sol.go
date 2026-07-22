func frogPosition(n int, edges [][]int, t int, target int) float64 {
    neighbors := make(map[int]map[int]bool)
    for i := 1; i <= n; i++ {
        neighbors[i] = make(map[int]bool)
    }
    for _, edge := range edges {
        a, b := edge[0], edge[1]
        neighbors[a][b] = true
        neighbors[b][a] = true
    }
    
    visited := make(map[int]bool)
    var probability float64
    
    var dfs func(vertex int, chance float64, elapsed int)
    dfs = func(vertex int, chance float64, elapsed int) {
        if elapsed == t {
            if vertex == target {
                probability = chance
            }
            return
        }
        visited[vertex] = true
        choices := []int{}
        for child := range neighbors[vertex] {
            if !visited[child] {
                choices = append(choices, child)
            }
        }
        
        if len(choices) == 0 {
            dfs(vertex, chance, elapsed+1)
        } else {
            for _, child := range choices {
                dfs(child, chance/float64(len(choices)), elapsed+1)
            }
        }
    }
    
    dfs(1, 1.0, 0)
    return probability
}
