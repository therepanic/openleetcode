func makeGood(s string) string {
    stack := []rune{}
    for _, ch := range s {
        if len(stack) > 0 && unicode.ToLower(ch) == unicode.ToLower(stack[len(stack)-1]) && ch != stack[len(stack)-1] {
            stack = stack[:len(stack)-1]
        } else {
            stack = append(stack, ch)
        }
    }
    return string(stack)
}
