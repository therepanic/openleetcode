func removeDuplicates(s string, k int) string {
    type pair struct {
        char  byte
        count int
    }
    stack := []pair{}
    for i := 0; i < len(s); i++ {
        c := s[i]
        if len(stack) > 0 && stack[len(stack)-1].char == c {
            stack[len(stack)-1].count++
        } else {
            stack = append(stack, pair{c, 1})
        }
        if stack[len(stack)-1].count == k {
            stack = stack[:len(stack)-1]
        }
    }
    var result []byte
    for _, p := range stack {
        for j := 0; j < p.count; j++ {
            result = append(result, p.char)
        }
    }
    return string(result)
}
