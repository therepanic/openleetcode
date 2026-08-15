func findMiddleIndex(nums []int) int {
    total := 0
    for _, num := range nums {
        total += num
    }
    
    leftSum := 0
    rightSum := total
    
    for i, num := range nums {
        rightSum -= num
        if leftSum == rightSum {
            return i
        }
        leftSum += num
    }
    
    return -1
}
