func decodeAtIndex(s string, k int) string {
    size := 0
    for _, ch := range s {
        if ch >= '0' && ch <= '9' {
            size *= int(ch - '0')
        } else {
            size++
        }
    }

    kk := k
    for i := len(s) - 1; i >= 0; i-- {
        ch := s[i]
        kk %= size
        if kk == 0 && ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z' {
            return string(ch)
        }
        if ch >= '0' && ch <= '9' {
            size /= int(ch - '0')
        } else {
            size--
        }
    }
    return ""
}
