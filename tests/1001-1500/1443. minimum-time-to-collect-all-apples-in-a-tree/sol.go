func minTime(n int, edges [][]int, hasApple []bool) int {
    adj := make([][]int, n)
    degree := make([]int, n)
    for i := 0; i < n; i++ {
        adj[i] = []int{}
    }

    for _, e := range edges {
        u, v := e[0], e[1]
        adj[u] = append(adj[u], v)
        adj[v] = append(adj[v], u)
        degree[u]++
        degree[v]++
    }

    q := []int{}
    for i := 1; i < n; i++ {
        if degree[i] == 1 && !hasApple[i] {
            q = append(q, i)
        }
    }

    keep := make([]bool, n)
    for i := range keep {
        keep[i] = true
    }

    for len(q) > 0 {
        u := q[0]
        q = q[1:]
        keep[u] = false

        for _, v := range adj[u] {
            degree[v]--
            if v != 0 && keep[v] && !hasApple[v] && degree[v] == 1 {
                q = append(q, v)
            }
        }
    }

    activeNodes := 0
    for _, k := range keep {
        if k {
            activeNodes++
        }
    }

    res := (activeNodes - 1) * 2
    if res < 0 {
        return 0
    }
    return res
}
