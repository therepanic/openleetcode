func isPrefixString(s string, words []string) bool {
    res := ""
    i := 0
    for len(res) < len(s) {
        if i >= len(words) {
            return false
        }
        res += words[i]
        i++
    }
    return res == s
}
