func gardenNoAdj(n int, paths [][]int) []int {
    graph := make(map[int][]int)
    
    for _, path := range paths {
        u, v := path[0], path[1]
        graph[u] = append(graph[u], v)
        graph[v] = append(graph[v], u)
    }
    
    for node := 1; node <= n; node++ {
        if _, exists := graph[node]; !exists {
            graph[node] = []int{}
        }
    }
    
    answer := make([]int, n+1)
    
    for i := 1; i <= n; i++ {
        used := make(map[int]bool)
        for _, nei := range graph[i] {
            used[answer[nei]] = true
        }
        
        for flower := 1; flower <= 4; flower++ {
            if !used[flower] {
                answer[i] = flower
                break
            }
        }
    }
    
    return answer[1:]
}
