func numIdenticalPairs(nums []int) int {
    pairs := make(map[int]int)
    count := 0
    for _, num := range nums {
        if val, ok := pairs[num]; ok {
            count += val
        }
        pairs[num]++
    }
    return count
}
