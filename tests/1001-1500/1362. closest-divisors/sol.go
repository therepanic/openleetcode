func closestDivisors(num int) []int {
    start := int(math.Sqrt(float64(num + 2)))
    for d := start; d >= 1; d-- {
        if (num + 1) % d == 0 {
            return []int{d, (num + 1) / d}
        }
        if (num + 2) % d == 0 {
            return []int{d, (num + 2) / d}
        }
    }
    return []int{}
}
