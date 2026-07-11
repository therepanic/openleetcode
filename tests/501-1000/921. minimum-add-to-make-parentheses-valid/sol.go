func minAddToMakeValid(s string) int {
    l := []byte{'0'}
    for i := 0; i < len(s); i++ {
        if l[len(l)-1] == '(' && s[i] == ')' {
            l = l[:len(l)-1]
        } else {
            l = append(l, s[i])
        }
    }
    return len(l) - 1
}
