func getMinDistance(nums []int, target int, start int) int {
    if nums[start] == target {
        return 0
    }
    
    n := len(nums)
    d := 1
    
    for {
        if start - d >= 0 && nums[start - d] == target {
            return d
        }
        
        if start + d < n && nums[start + d] == target {
            return d
        }
        
        d++
    }
}
