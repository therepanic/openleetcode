func longestPrefix(s string) string {
    n := len(s)
    prefix := make([]int, n)
    matched := 0
    for i := 1; i < n; i++ {
        for matched > 0 && s[i] != s[matched] {
            matched = prefix[matched-1]
        }
        if s[i] == s[matched] {
            matched++
        }
        prefix[i] = matched
    }
    return s[:prefix[n-1]]
}
