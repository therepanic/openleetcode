func calculate(s string) int {
    stack := []int{}
    res := 0
    curr := 0
    sign := 1

    for _, c := range s {
        if c >= '0' && c <= '9' {
            curr = curr * 10 + int(c - '0')
        } else if c == '+' {
            res += sign * curr
            sign = 1
            curr = 0
        } else if c == '-' {
            res += sign * curr
            sign = -1
            curr = 0
        } else if c == '(' {
            stack = append(stack, res)
            stack = append(stack, sign)
            res = 0
            sign = 1
        } else if c == ')' {
            res += sign * curr
            curr = 0
            res *= stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            res += stack[len(stack)-1]
            stack = stack[:len(stack)-1]
        }
    }

    res += sign * curr
    return res
}
