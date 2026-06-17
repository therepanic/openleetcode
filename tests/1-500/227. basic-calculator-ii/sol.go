func calculate(s string) int {
    stack := []int{}
    n := 0
    op := byte('+')
    s += "+"
    
    for i := 0; i < len(s); i++ {
        c := s[i]
        if c == ' ' {
            continue
        }
        
        if c >= '0' && c <= '9' {
            n = n * 10 + int(c - '0')
            continue
        }
        
        switch op {
        case '+':
            stack = append(stack, n)
        case '-':
            stack = append(stack, -n)
        case '*':
            stack[len(stack)-1] *= n
        case '/':
            stack[len(stack)-1] /= n
        }
        
        op = c
        n = 0
    }
    
    result := 0
    for _, num := range stack {
        result += num
    }
    return result
}
