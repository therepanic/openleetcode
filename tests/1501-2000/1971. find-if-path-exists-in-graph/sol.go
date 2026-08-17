func validPath(n int, edges [][]int, source int, destination int) bool {
    if source == destination {
        return true
    }
    graph := make(map[int][]int)
    for _, edge := range edges {
        graph[edge[0]] = append(graph[edge[0]], edge[1])
        graph[edge[1]] = append(graph[edge[1]], edge[0])
    }
    queue := []int{source}
    visited := make(map[int]bool)
    visited[source] = true
    for len(queue) > 0 {
        node := queue[0]
        queue = queue[1:]
        if node == destination {
            return true
        }
        for _, neighbor := range graph[node] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue = append(queue, neighbor)
            }
        }
    }
    return false
}
