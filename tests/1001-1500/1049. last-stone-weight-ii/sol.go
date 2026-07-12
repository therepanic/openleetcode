func lastStoneWeightII(stones []int) int {
    n := len(stones)
    total := 0
    for _, v := range stones {
        total += v
    }
    target := total / 2
    dp_prev := make([]int, target+1)
    for i := n - 1; i >= 0; i-- {
        dp_curr := make([]int, target+1)
        for size := 0; size <= target; size++ {
            skip := dp_prev[size]
            take := int(math.Inf(-1))
            if size >= stones[i] {
                take = dp_prev[size - stones[i]] + stones[i]
            }
            if skip > take {
                dp_curr[size] = skip
            } else {
                dp_curr[size] = take
            }
        }
        dp_prev = dp_curr
    }
    return total - 2 * dp_prev[target]
}
