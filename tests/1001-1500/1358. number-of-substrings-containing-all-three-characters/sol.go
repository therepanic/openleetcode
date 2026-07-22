func numberOfSubstrings(s string) int {
    res := 0
    p := [4]int{50000, -1, -1, -1}
    for i, ch := range s {
        p[ch&31] = i
        min := p[1]
        if p[2] < min { min = p[2] }
        if p[3] < min { min = p[3] }
        res += min + 1
    }
    return res
}
