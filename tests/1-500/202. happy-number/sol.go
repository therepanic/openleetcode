func isHappy(n int) bool {
    seen := map[int]bool{}
    for n != 1 && !seen[n] {
        seen[n] = true
        n = nextValue(n)
    }
    return n == 1
}

func nextValue(n int) int {
    total := 0
    for n > 0 {
        digit := n % 10
        total += digit * digit
        n /= 10
    }
    return total
}
