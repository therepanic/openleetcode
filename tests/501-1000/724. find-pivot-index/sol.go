func pivotIndex(nums []int) int {
    totalSum := 0
    for _, num := range nums {
        totalSum += num
    }
    lSum := 0
    rSum := totalSum
    for i, num := range nums {
        rSum -= num
        if lSum == rSum {
            return i
        }
        lSum += num
    }
    return -1
}
