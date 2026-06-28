func monotoneIncreasingDigits(n int) int {
    s := []byte(strconv.Itoa(n))
    mark := len(s)
    for i := len(s) - 1; i > 0; i-- {
        if s[i] < s[i-1] {
            s[i-1]--
            mark = i
        }
    }
    for i := mark; i < len(s); i++ {
        s[i] = '9'
    }
    result, _ := strconv.Atoi(string(s))
    return result
}
