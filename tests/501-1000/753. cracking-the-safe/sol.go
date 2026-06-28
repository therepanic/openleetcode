func crackSafe(n int, k int) string {
    if n == 1 {
        var res string
        for i := 0; i < k; i++ {
            res += string('0' + byte(i))
        }
        return res
    }
    
    adj := make(map[string][]int)
    startNode := strings.Repeat("0", n-1)
    var res strings.Builder
    
    var visit func(string)
    visit = func(node string) {
        if _, ok := adj[node]; !ok {
            for i := k - 1; i >= 0; i-- {
                adj[node] = append(adj[node], i)
            }
        }
        for len(adj[node]) > 0 {
            digit := adj[node][len(adj[node])-1]
            adj[node] = adj[node][:len(adj[node])-1]
            nextNode := (node + strconv.Itoa(digit))[1:]
            visit(nextNode)
            res.WriteString(strconv.Itoa(digit))
        }
    }
    
    visit(startNode)
    return res.String() + startNode
}
