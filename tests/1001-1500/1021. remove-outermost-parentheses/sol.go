func removeOuterParentheses(s string) string {
    var res []byte
    balance := 0
    start := 0
    for i, ch := range s {
        if ch == '(' {
            balance++
        } else {
            balance--
        }
        if balance == 0 {
            res = append(res, s[start+1:i]...)
            start = i + 1
        }
    }
    return string(res)
}
