func smallestEquivalentString(s1 string, s2 string, baseStr string) string {
    adj := make(map[byte][]byte)
    for i := 0; i < len(s1); i++ {
        a, b := s1[i], s2[i]
        adj[a] = append(adj[a], b)
        adj[b] = append(adj[b], a)
    }

    var dfs func(ch byte, visited map[byte]bool) byte
    dfs = func(ch byte, visited map[byte]bool) byte {
        visited[ch] = true
        minCh := ch
        for _, nei := range adj[ch] {
            if !visited[nei] {
                candidate := dfs(nei, visited)
                if candidate < minCh {
                    minCh = candidate
                }
            }
        }
        return minCh
    }

    result := make([]byte, len(baseStr))
    for i := 0; i < len(baseStr); i++ {
        visited := make(map[byte]bool)
        result[i] = dfs(baseStr[i], visited)
    }
    return string(result)
}
