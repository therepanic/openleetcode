func minElements(nums []int, limit int, goal int) int {
    currentSum := int64(0)
    for _, num := range nums {
        currentSum += int64(num)
    }
    diff := int64(goal) - currentSum
    if diff < 0 {
        diff = -diff
    }
    return int((diff + int64(limit) - 1) / int64(limit))
}
