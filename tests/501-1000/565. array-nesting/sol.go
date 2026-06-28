func arrayNesting(nums []int) int {
    maxCount := 0
    
    for i := 0; i < len(nums); i++ {
        if nums[i] == -1 {
            continue
        }
        
        currentCount := 0
        start := i
        
        for nums[start] != -1 {
            nextNode := nums[start]
            nums[start] = -1
            start = nextNode
            currentCount++
        }
        
        if currentCount > maxCount {
            maxCount = currentCount
        }
    }
    
    return maxCount
}
