func canBeIncreasing(nums []int) bool {
    n := len(nums)
    idx := -1
    
    for i := 0; i < n-1; i++ {
        if nums[i] >= nums[i+1] {
            idx = i
            break
        }
    }
    
    flag := true
    for i := idx + 1; i < n-1; i++ {
        if nums[i] >= nums[i+1] {
            flag = false
            break
        }
    }
    
    if (idx == 0 || idx == n-1) && flag {
        return true
    }
    if idx-1 >= 0 && idx+1 < n && nums[idx-1] < nums[idx+1] && flag {
        return true
    }
    
    for i := n - 1; i > 0; i-- {
        if nums[i] <= nums[i-1] {
            idx = i
            break
        }
    }
    
    flag = true
    for i := idx - 1; i > 0; i-- {
        if nums[i] <= nums[i-1] {
            flag = false
            break
        }
    }
    
    if (idx == 0 || idx == n-1) && flag {
        return true
    }
    if idx-1 >= 0 && idx+1 < n && nums[idx-1] >= nums[idx+1] {
        return false
    }
    return flag
}
