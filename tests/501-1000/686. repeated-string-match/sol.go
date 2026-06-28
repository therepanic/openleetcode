func repeatedStringMatch(a string, b string) int {
    repeatA := a
    count := 1

    for len(repeatA) < len(b) {
        repeatA += a
        count++
        if strings.Contains(repeatA, b) {
            return count
        }
    }

    repeatA += a
    count++
    if strings.Contains(repeatA, b) {
        return count
    }

    return -1
}
