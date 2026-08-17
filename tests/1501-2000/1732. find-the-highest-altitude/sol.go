func largestAltitude(gain []int) int {
    ans, acc := 0, 0
    for _, it := range gain {
        acc += it
        d := acc - ans
        ans += d & ^(d >> 31)
    }
    return ans
}
