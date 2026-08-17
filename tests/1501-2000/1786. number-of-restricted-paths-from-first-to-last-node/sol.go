func countRestrictedPaths(n int, edges [][]int) int {
    const mod = 1000000007
    graph := make([][][2]int, n+1)
    for _, e := range edges {
        graph[e[0]] = append(graph[e[0]], [2]int{e[1], e[2]})
        graph[e[1]] = append(graph[e[1]], [2]int{e[0], e[2]})
    }

    dist := make([]int, n+1)
    for i := range dist {
        dist[i] = int(^uint(0) >> 1)
    }
    dist[n] = 0
    pq := [][2]int{{0, n}}
    for len(pq) > 0 {
        best := 0
        for i := 1; i < len(pq); i++ { if pq[i][0] < pq[best][0] { best = i } }
        top := pq[best]
        pq[best] = pq[len(pq)-1]
        pq = pq[:len(pq)-1]
        d, node := top[0], top[1]
        if d > dist[node] {
            continue
        }
        for _, nb := range graph[node] {
            next, w := nb[0], nb[1]
            nd := d + w
            if nd < dist[next] {
                dist[next] = nd
                pq = append(pq, [2]int{nd, next})
            }
        }
    }

    dp := make([]int64, n+1)
    dp[n] = 1
    nodes := make([]int, n)
    for i := 1; i <= n; i++ {
        nodes[i-1] = i
    }
    sort.Slice(nodes, func(i, j int) bool {
        return dist[nodes[i]] < dist[nodes[j]]
    })
    for _, u := range nodes {
        for _, nb := range graph[u] {
            v := nb[0]
            if dist[u] > dist[v] {
                dp[u] = (dp[u] + dp[v]) % int64(mod)
            }
        }
    }
    return int(dp[1] % int64(mod))
}

