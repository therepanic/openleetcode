func minInsertions(s string) int {
    stack := make([]byte, 0)
    count := 0
    i := 0
    
    for i < len(s) {
        if s[i] == '(' {
            stack = append(stack, '(')
        } else {
            if len(stack) == 0 {
                if i != len(s)-1 && s[i+1] == ')' {
                    count += 1
                    i++
                } else {
                    count += 2
                }
            } else {
                if i != len(s)-1 && s[i+1] == ')' {
                    stack = stack[:len(stack)-1]
                    i++
                } else {
                    count += 1
                    stack = stack[:len(stack)-1]
                }
            }
        }
        i++
    }
    
    return count + len(stack)*2
}
