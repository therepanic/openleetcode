func containsNearbyDuplicate(nums []int, k int) bool {
    windowSet := make(map[int]bool)
    
    for i := 0; i < len(nums); i++ {
        if i > k {
            delete(windowSet, nums[i - k - 1])
        }
        
        if windowSet[nums[i]] {
            return true
        }
        
        windowSet[nums[i]] = true
    }
    
    return false
}
