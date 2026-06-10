func trailingZeroes(n int) int {
    count := 0
    for divisor := 5; divisor <= n; divisor *= 5 { count += n / divisor }
    return count
}
