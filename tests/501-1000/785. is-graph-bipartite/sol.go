func isBipartite(graph [][]int) bool {
    N := len(graph)
    colors := make([]int, N)
    for i := range colors {
        colors[i] = -1
    }
    
    var checkBipartite func(int, int) bool
    checkBipartite = func(u int, currColor int) bool {
        colors[u] = currColor
        for _, v := range graph[u] {
            if colors[v] == -1 {
                if !checkBipartite(v, 1 - currColor) {
                    return false
                }
            } else {
                if colors[v] == currColor {
                    return false
                }
            }
        }
        return true
    }
    
    for u := 0; u < N; u++ {
        if colors[u] == -1 {
            if !checkBipartite(u, 0) {
                return false
            }
        }
    }
    return true
}
