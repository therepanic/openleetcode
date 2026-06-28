func divide(dividend int, divisor int) int {
    if dividend == -1<<31 && divisor == -1 {
        return 1<<31 - 1
    }
    q := int64(dividend) / int64(divisor)
    if q < math.MinInt32 {
        return math.MinInt32
    }
    if q > math.MaxInt32 {
        return math.MaxInt32
    }
    return int(q)
}
