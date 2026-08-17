func evaluate(s string, knowledge [][]string) string {
    mp := make(map[string]string)
    for _, pair := range knowledge {
        mp[pair[0]] = pair[1]
    }
    ans := ""
    i, n := 0, len(s)
    for i < n {
        if s[i] == '(' {
            i++
            temp := ""
            for i < n && s[i] != ')' {
                temp += string(s[i])
                i++
            }
            if val, ok := mp[temp]; ok {
                ans += val
            } else {
                ans += "?"
            }
            i++
        } else {
            ans += string(s[i])
            i++
        }
    }
    return ans
}
