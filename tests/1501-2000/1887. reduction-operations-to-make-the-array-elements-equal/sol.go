func reductionOperations(nums []int) int {
    freq := make([]int, 50001)
    for _, num := range nums {
        freq[num]++
    }
    idx := 1
    for freq[idx] == 0 {
        idx++
    }
    val, total := 0, 0
    for i := 50000; i > idx; i-- {
        if freq[i] > 0 {
            val += freq[i]
            total += val
        }
    }
    return total
}
