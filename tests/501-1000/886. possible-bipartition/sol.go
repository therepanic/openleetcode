func possibleBipartition(n int, dislikes [][]int) bool {
    graph := make(map[int][]int)
    for _, edge := range dislikes {
        u, v := edge[0], edge[1]
        graph[u] = append(graph[u], v)
        graph[v] = append(graph[v], u)
    }
    
    color := make([]int, n+1)
    
    for node := 1; node <= n; node++ {
        if color[node] != 0 {
            continue
        }
        if _, exists := graph[node]; !exists {
            continue
        }
        
        queue := []int{node}
        color[node] = 1
        
        for len(queue) > 0 {
            curr := queue[0]
            queue = queue[1:]
            
            for _, neighbor := range graph[curr] {
                if color[neighbor] == color[curr] {
                    return false
                }
                
                if color[neighbor] == 0 {
                    color[neighbor] = -color[curr]
                    queue = append(queue, neighbor)
                }
            }
        }
    }
    
    return true
}
