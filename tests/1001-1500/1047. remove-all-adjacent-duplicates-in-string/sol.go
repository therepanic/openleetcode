func removeDuplicates(s string) string {
    stack := []byte{}
    for i := 0; i < len(s); i++ {
        c := s[i]
        if len(stack) > 0 && stack[len(stack)-1] == c {
            stack = stack[:len(stack)-1]
        } else {
            stack = append(stack, c)
        }
    }
    return string(stack)
}
