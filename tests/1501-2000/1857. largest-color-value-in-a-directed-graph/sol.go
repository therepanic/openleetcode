func largestPathValue(colors string, edges [][]int) int {
    INF := int(^uint(0) >> 1)
    n := len(colors)
    adj := make([][]int, n)
    for _, e := range edges {
        adj[e[0]] = append(adj[e[0]], e[1])
    }
    
    count := make([][]int, n)
    for i := range count {
        count[i] = make([]int, 26)
    }
    vis := make([]int, n)
    
    var dfs func(int) int
    dfs = func(node int) int {
        if vis[node] == 1 {
            return INF
        }
        if vis[node] == 2 {
            return count[node][colors[node]-'a']
        }
        
        vis[node] = 1
        for _, nxt := range adj[node] {
            res := dfs(nxt)
            if res == INF {
                return INF
            }
            for c := 0; c < 26; c++ {
                if count[nxt][c] > count[node][c] {
                    count[node][c] = count[nxt][c]
                }
            }
        }
        
        col := int(colors[node] - 'a')
        count[node][col]++
        vis[node] = 2
        return count[node][col]
    }
    
    ans := 0
    for i := 0; i < n; i++ {
        val := dfs(i)
        if val == INF {
            return -1
        }
        if val > ans {
            ans = val
        }
    }
    
    return ans
}
