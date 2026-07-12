func smallestRangeI(nums []int, k int) int {
    minVal := nums[0]
    maxVal := nums[0]
    
    for _, val := range nums {
        if val < minVal {
            minVal = val
        } else if val > maxVal {
            maxVal = val
        }
    }
    
    result := maxVal - minVal - k*2
    if result < 0 {
        return 0
    }
    return result
}
