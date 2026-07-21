func reverseParentheses(s string) string {
    i := 0
    var helper func() string
    helper = func() string {
        ans := ""
        for i < len(s) {
            if s[i] == '(' {
                i++
                ans += helper()
            } else if s[i] == ')' {
                i++
                return reverseString(ans)
            } else {
                ans += string(s[i])
                i++
            }
        }
        return ans
    }
    return helper()
}

func reverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}
