func findWords(words []string) []string {
    m := make(map[byte]int)
    for _, c := range "qwertyuiop" {
        m[byte(c)] = 1
    }
    for _, c := range "asdfghjkl" {
        m[byte(c)] = 2
    }
    for _, c := range "zxcvbnm" {
        m[byte(c)] = 3
    }
    ans := []string{}
    for _, w := range words {
        lw := strings.ToLower(w)
        r := m[lw[0]]
        ok := true
        for _, ch := range lw {
            if m[byte(ch)] != r {
                ok = false
                break
            }
        }
        if ok {
            ans = append(ans, w)
        }
    }
    return ans
}
