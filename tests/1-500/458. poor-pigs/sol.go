func poorPigs(buckets int, minutesToDie int, minutesToTest int) int {
    base := minutesToTest / minutesToDie + 1
    ans := 0
    n := 1
    for n < buckets {
        n *= base
        ans++
    }
    return ans
}
