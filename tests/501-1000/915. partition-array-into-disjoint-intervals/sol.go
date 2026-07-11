func partitionDisjoint(nums []int) int {
    n := len(nums)
    prefixMax := make([]int, n)
    prefixMax[0] = nums[0]
    for i := 1; i < n; i++ {
        if nums[i] > prefixMax[i-1] {
            prefixMax[i] = nums[i]
        } else {
            prefixMax[i] = prefixMax[i-1]
        }
    }
    
    suffixMin := make([]int, n)
    suffixMin[n-1] = nums[n-1]
    for i := n-2; i >= 0; i-- {
        if nums[i] < suffixMin[i+1] {
            suffixMin[i] = nums[i]
        } else {
            suffixMin[i] = suffixMin[i+1]
        }
    }
    
    for i := 0; i < n-1; i++ {
        if prefixMax[i] <= suffixMin[i+1] {
            return i + 1
        }
    }
    return -1
}
