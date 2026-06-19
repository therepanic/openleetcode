func totalHammingDistance(nums []int) int {
    total := 0
    n := len(nums)
    for i := 0; i < 32; i++ {
        ones := 0
        for _, num := range nums {
            ones += (num >> i) & 1
        }
        total += ones * (n - ones)
    }
    return total
}
