func countNumbersWithUniqueDigits(n int) int {
    if n == 0 {
        return 1
    }
    if n == 1 {
        return 10
    }
    result := 10
    current := 9
    for i := 2; i <= n; i++ {
        current *= (10 - (i - 1))
        result += current
    }
    return result
}
