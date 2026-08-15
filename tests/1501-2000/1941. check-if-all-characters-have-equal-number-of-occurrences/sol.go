func areOccurrencesEqual(s string) bool {
    m := make(map[rune]int)
    for _, c := range s {
        m[c]++
    }
    vals := make(map[int]bool)
    for _, v := range m {
        vals[v] = true
    }
    return len(vals) == 1
}
