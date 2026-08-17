func findLexSmallestString(s string, a int, b int) string {
    n := len(s)
    seen := make(map[string]bool)
    var dfs func(string)
    dfs = func(cur string) {
        if seen[cur] { return }
        seen[cur] = true
        add := []byte(cur)
        for i := 1; i < n; i += 2 {
            add[i] = byte('0' + (int(add[i]-'0')+a)%10)
        }
        dfs(string(add))
        dfs(cur[n-b:] + cur[:n-b])
    }
    dfs(s)
    minStr := s
    for str := range seen {
        if str < minStr {
            minStr = str
        }
    }
    return minStr
}
