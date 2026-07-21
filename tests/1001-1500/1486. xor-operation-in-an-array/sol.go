func xorOperation(n int, start int) int {
    ans := 0
    for n > 0 {
        ans ^= start
        start += 2
        n--
    }
    return ans
}
