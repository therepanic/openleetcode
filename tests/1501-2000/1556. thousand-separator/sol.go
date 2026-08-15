func thousandSeparator(n int) string {
    s := fmt.Sprintf("%d", n)
    if len(s) <= 3 {
        return s
    }
    result := make([]byte, 0)
    count := 0
    for i := len(s) - 1; i >= 0; i-- {
        result = append(result, s[i])
        count++
        if count%3 == 0 && i > 0 {
            result = append(result, '.')
        }
    }
    // reverse result
    for i, j := 0, len(result)-1; i < j; i, j = i+1, j-1 {
        result[i], result[j] = result[j], result[i]
    }
    return string(result)
}
