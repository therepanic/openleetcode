func findAndReplacePattern(words []string, pattern string) []string {
    counts := signature(pattern)
    res := make([]string, 0)
    for _, word := range words {
        if equal(signature(word), counts) {
            res = append(res, word)
        }
    }
    return res
}

func signature(s string) []int {
    first := make(map[byte]int)
    out := make([]int, len(s))
    for i := 0; i < len(s); i++ {
        if idx, ok := first[s[i]]; ok {
            out[i] = idx
        } else {
            first[s[i]] = i
            out[i] = i
        }
    }
    return out
}

func equal(a, b []int) bool {
    if len(a) != len(b) {
        return false
    }
    for i := range a {
        if a[i] != b[i] {
            return false
        }
    }
    return true
}
