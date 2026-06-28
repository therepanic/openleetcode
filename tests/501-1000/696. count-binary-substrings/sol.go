func countBinarySubstrings(s string) int {
    ans, prev, cur := 0, 0, 1
    for i := 1; i < len(s); i++ {
        if s[i-1] != s[i] {
            ans += min(prev, cur)
            prev, cur = cur, 1
        } else {
            cur++
        }
    }
    return ans + min(prev, cur)
}
