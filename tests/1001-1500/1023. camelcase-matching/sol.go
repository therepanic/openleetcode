func camelMatch(queries []string, pattern string) []bool {
    ans := make([]bool, 0, len(queries))
    for _, query := range queries {
        j := 0
        i := 0
        for i < len(query) {
            if query[i] >= 'A' && query[i] <= 'Z' && ((j < len(pattern) && query[i] != pattern[j]) || j > len(pattern)-1) {
                break
            }
            if j < len(pattern) && query[i] == pattern[j] {
                j++
            }
            i++
        }
        if i == len(query) && j == len(pattern) {
            ans = append(ans, true)
        } else {
            ans = append(ans, false)
        }
    }
    return ans
}
