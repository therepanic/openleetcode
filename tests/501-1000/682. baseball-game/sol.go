func calPoints(operations []string) int {
    stack := []int{}
    for _, op := range operations {
        switch op {
        case "C":
            stack = stack[:len(stack)-1]
        case "D":
            stack = append(stack, stack[len(stack)-1]*2)
        case "+":
            stack = append(stack, stack[len(stack)-1]+stack[len(stack)-2])
        default:
            val, _ := strconv.Atoi(op)
            stack = append(stack, val)
        }
    }
    sum := 0
    for _, v := range stack {
        sum += v
    }
    return sum
}
