func minReorder(n int, connections [][]int) int {
    roads := make(map[string]bool)
    graph := make([][]int, n)
    for i := 0; i < n; i++ {
        graph[i] = []int{}
    }
    for _, conn := range connections {
        x, y := conn[0], conn[1]
        graph[x] = append(graph[x], y)
        graph[y] = append(graph[y], x)
        key := fmt.Sprintf("%d,%d", x, y)
        roads[key] = true
    }
    
    seen := make([]bool, n)
    seen[0] = true
    var dfs func(int) int
    dfs = func(node int) int {
        ans := 0
        for _, neighbor := range graph[node] {
            if !seen[neighbor] {
                key := fmt.Sprintf("%d,%d", node, neighbor)
                if roads[key] {
                    ans++
                }
                seen[neighbor] = true
                ans += dfs(neighbor)
            }
        }
        return ans
    }
    
    return dfs(0)
}
