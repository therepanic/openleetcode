func numPairsDivisibleBy60(time []int) int {
    remainders := make([]int, 60)
    for _, t := range time {
        remainders[t % 60]++
    }
    
    count := 0
    count += remainders[0] * (remainders[0] - 1) / 2
    count += remainders[30] * (remainders[30] - 1) / 2
    
    for i := 1; i < 30; i++ {
        count += remainders[i] * remainders[60 - i]
    }
    
    return count
}
