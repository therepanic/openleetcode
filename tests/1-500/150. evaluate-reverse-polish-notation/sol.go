func evalRPN(tokens []string) int {
    stack := make([]int, 0, len(tokens))
    for _, token := range tokens {
        switch token {
        case "+", "-", "*", "/":
            b := stack[len(stack)-1]
            a := stack[len(stack)-2]
            stack = stack[:len(stack)-2]
            value := 0
            switch token {
            case "+":
                value = a + b
            case "-":
                value = a - b
            case "*":
                value = a * b
            default:
                value = a / b
            }
            stack = append(stack, value)
        default:
            stack = append(stack, atoi150(token))
        }
    }
    return stack[len(stack)-1]
}

func atoi150(s string) int {
    sign := 1
    index := 0
    if s[0] == '-' {
        sign = -1
        index = 1
    }
    value := 0
    for ; index < len(s); index++ {
        value = value*10 + int(s[index]-'0')
    }
    return sign * value
}
