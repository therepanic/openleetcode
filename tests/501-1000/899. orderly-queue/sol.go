func orderlyQueue(s string, k int) string {
    if k > 1 {
        chars := []rune(s)
        sort.Slice(chars, func(i, j int) bool {
            return chars[i] < chars[j]
        })
        return string(chars)
    }
    
    res := s
    for i := 0; i < len(s); i++ {
        s = s[1:] + s[:1]
        if s < res {
            res = s
        }
    }
    
    return res
}
