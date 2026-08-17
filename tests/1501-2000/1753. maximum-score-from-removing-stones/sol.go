func maximumScore(a int, b int, c int) int {
    sum := a + b + c
    max := a
    if b > max {
        max = b
    }
    if c > max {
        max = c
    }
    if sum - max < sum / 2 {
        return sum - max
    }
    return sum / 2
}
