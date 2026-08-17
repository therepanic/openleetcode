func minCostConnectPoints(points [][]int) int {
    n := len(points)
    minCost := 0
    visited := make([]bool, n)
    best := make([]int, n)
    for i := range best { best[i] = int(^uint(0) >> 1) }
    best[0] = 0

    for step := 0; step < n; step++ {
        u := -1
        for i := 0; i < n; i++ {
            if !visited[i] && (u == -1 || best[i] < best[u]) { u = i }
        }
        visited[u] = true
        minCost += best[u]
        for v := 0; v < n; v++ {
            if !visited[v] {
                dist := abs(points[u][0]-points[v][0]) + abs(points[u][1]-points[v][1])
                if dist < best[v] { best[v] = dist }
            }
        }
    }
    return minCost
}

func abs(x int) int {
    if x < 0 { return -x }
    return x
}
