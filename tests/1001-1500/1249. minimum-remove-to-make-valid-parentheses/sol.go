func minRemoveToMakeValid(s string) string {
    t := make([]byte, 0)
    p := 0
    for i := 0; i < len(s); i++ {
        c := s[i]
        if c == '(' {
            p++
        } else if c == ')' {
            p--
        }
        if p >= 0 {
            t = append(t, c)
        } else {
            p = 0
        }
    }
    p = 0
    result := make([]byte, 0)
    for i := len(t) - 1; i >= 0; i-- {
        c := t[i]
        if c == '(' {
            p++
        } else if c == ')' {
            p--
        }
        if p <= 0 {
            result = append(result, c)
        } else {
            p = 0
        }
    }
    for i, j := 0, len(result)-1; i < j; i, j = i+1, j-1 {
        result[i], result[j] = result[j], result[i]
    }
    return string(result)
}
