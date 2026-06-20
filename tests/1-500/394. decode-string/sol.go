func decodeString(s string) string {
    i := 0
    var decode func() string
    decode = func() string {
        res := ""
        num := 0
        for i < len(s) {
            c := s[i]
            if c >= '0' && c <= '9' {
                num = num * 10 + int(c - '0')
                i++
            } else if c == '[' {
                i++
                inner := decode()
                for j := 0; j < num; j++ {
                    res += inner
                }
                num = 0
            } else if c == ']' {
                i++
                return res
            } else {
                res += string(c)
                i++
            }
        }
        return res
    }
    return decode()
}
