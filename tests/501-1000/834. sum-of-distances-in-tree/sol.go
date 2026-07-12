func sumOfDistancesInTree(n int, edges [][]int) []int {
    adj := make([][]int, n)
    for _, e := range edges {
        u, v := e[0], e[1]
        adj[u] = append(adj[u], v)
        adj[v] = append(adj[v], u)
    }
    
    count := make([]int, n)
    ans := make([]int, n)
    for i := range count {
        count[i] = 1
    }
    
    var dfsIn func(int, int)
    dfsIn = func(node, parent int) {
        for _, child := range adj[node] {
            if child != parent {
                dfsIn(child, node)
                count[node] += count[child]
                ans[node] += ans[child] + count[child]
            }
        }
    }
    
    var dfsOut func(int, int)
    dfsOut = func(node, parent int) {
        for _, child := range adj[node] {
            if child != parent {
                ans[child] = ans[node] - count[child] + (n - count[child])
                dfsOut(child, node)
            }
        }
    }
    
    dfsIn(0, -1)
    dfsOut(0, -1)
    return ans
}
