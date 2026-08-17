func finalValueAfterOperations(operations []string) int {
    result := 0
    for _, op := range operations {
        if op[1] == '+' {
            result++
        } else {
            result--
        }
    }
    return result
}
