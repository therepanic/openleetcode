func countDigitOne(n int) int {
    count := 0
    factor := 1
    for factor <= n {
        lower := n % factor
        cur := (n / factor) % 10
        higher := n / (factor * 10)
        if cur == 0 {
            count += higher * factor
        } else if cur == 1 {
            count += higher * factor + lower + 1
        } else {
            count += (higher + 1) * factor
        }
        factor *= 10
    }
    return count
}
