func minMoves(nums []int) int {
    sum := 0
    min := nums[0]
    for _, num := range nums {
        sum += num
        if num < min {
            min = num
        }
    }
    return sum - len(nums) * min
}
