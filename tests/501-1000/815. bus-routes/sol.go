func numBusesToDestination(routes [][]int, source int, target int) int {
    if source == target {
        return 0
    }
    adj := make(map[int]map[int]bool)
    for bus, locations := range routes {
        for _, location := range locations {
            if adj[location] == nil {
                adj[location] = make(map[int]bool)
            }
            adj[location][bus] = true
        }
    }
    queue := make([]int, 0)
    for bus := range adj[target] {
        queue = append(queue, bus)
    }
    cost := 0
    visited := make(map[int]bool)
    for len(queue) > 0 {
        cost++
        size := len(queue)
        for i := 0; i < size; i++ {
            node := queue[0]
            queue = queue[1:]
            visited[node] = true
            for _, location := range routes[node] {
                if location == source {
                    return cost
                }
            }
            for _, location := range routes[node] {
                for bus := range adj[location] {
                    if !visited[bus] {
                        queue = append(queue, bus)
                    }
                }
            }
        }
    }
    return -1
}
