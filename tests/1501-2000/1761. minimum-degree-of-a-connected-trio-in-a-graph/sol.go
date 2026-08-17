func minTrioDegree(n int, edges [][]int) int {
    adj := make([][]int, n+1)
    for i := range adj {
        adj[i] = make([]int, n+1)
    }
    deg := make([]int, n+1)
    for _, e := range edges {
        adj[e[0]][e[1]] = 1
        adj[e[1]][e[0]] = 1
        deg[e[0]]++
        deg[e[1]]++
    }
    ans := int(^uint(0) >> 1) // max int
    for _, e := range edges {
        u, v := e[0], e[1]
        for w := 1; w <= n; w++ {
            if adj[u][w] == 1 && adj[v][w] == 1 {
                val := deg[u] + deg[v] + deg[w] - 6
                if val < ans {
                    ans = val
                }
            }
        }
    }
    if ans == int(^uint(0) >> 1) {
        return -1
    }
    return ans
}
