func chalkReplacer(chalk []int, k int) int {
    total := int64(0)
    for _, amount := range chalk {
        total += int64(amount)
    }
    remaining := int64(k) % total
    for i, amount := range chalk {
        if remaining < int64(amount) {
            return i
        }
        remaining -= int64(amount)
    }
    return 0
}
