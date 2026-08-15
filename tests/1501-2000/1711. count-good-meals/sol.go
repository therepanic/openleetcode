func countPairs(deliciousness []int) int {
    const MOD = 1000000007
    maxVal := 0
    for _, d := range deliciousness {
        if d > maxVal {
            maxVal = d
        }
    }
    _ = maxVal
    powers := make([]int, 22)
    for i := 0; i < 22; i++ {
        powers[i] = 1 << i
    }
    count := make(map[int]int)
    res := 0

    for _, val := range deliciousness {
        for _, target := range powers {
            complement := target - val
            if c, ok := count[complement]; ok {
                res += c
                res %= MOD
            }
        }
        count[val]++
    }
    return res
}
