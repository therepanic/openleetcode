func sumBase(n int, k int) int {
    total := 0
    for n > 0 {
        total += n % k
        n /= k
    }
    return total
}
