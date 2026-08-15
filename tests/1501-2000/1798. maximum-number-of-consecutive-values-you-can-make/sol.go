func getMaximumConsecutive(coins []int) int {
    sort.Ints(coins)
    maxConsecutive := 0
    
    for _, coin := range coins {
        if coin > maxConsecutive + 1 {
            break
        }
        maxConsecutive += coin
    }
    
    return maxConsecutive + 1
}
