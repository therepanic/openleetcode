func maxProbability(n int, edges [][]int, succProb []float64, start_node int, end_node int) float64 {
    dist := make([]float64, n)
    dist[start_node] = 1.0
    
    for k := 0; k < n-1; k++ {
        updated := false
        for i, edge := range edges {
            u, v := edge[0], edge[1]
            if dist[u]*succProb[i] > dist[v] {
                dist[v] = dist[u] * succProb[i]
                updated = true
            }
            if dist[v]*succProb[i] > dist[u] {
                dist[u] = dist[v] * succProb[i]
                updated = true
            }
        }
        if !updated {
            break
        }
    }
    
    return dist[end_node]
}
