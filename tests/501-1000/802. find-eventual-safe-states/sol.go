func eventualSafeNodes(graph [][]int) []int {
    n := len(graph)
    state := make([]int, n) // 0: unvisited, 1: visiting, 2: safe
    safe := make([]int, 0)
    
    var dfs func(int) bool
    dfs = func(node int) bool {
        if state[node] > 0 {
            return state[node] == 2
        }
        
        state[node] = 1
        
        for _, neighbor := range graph[node] {
            if state[neighbor] == 1 || !dfs(neighbor) {
                return false
            }
        }
        
        state[node] = 2
        return true
    }
    
    for i := 0; i < n; i++ {
        if dfs(i) {
            safe = append(safe, i)
        }
    }
    
    return safe
}
