func isIsomorphic(s string, t string) bool {
    st := make([]int, 256)
    ts := make([]int, 256)
    for i := 0; i < 256; i++ {
        st[i], ts[i] = -1, -1
    }
    for i := 0; i < len(s); i++ {
        a, b := s[i], t[i]
        if st[a] != ts[b] {
            return false
        }
        st[a], ts[b] = i, i
    }
    return true
}
