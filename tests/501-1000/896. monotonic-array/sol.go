func isMonotonic(nums []int) bool {
    n := len(nums)
    if nums[0] < nums[n-1] {
        for i := 1; i < n; i++ {
            if nums[i] < nums[i-1] {
                return false
            }
        }
    } else {
        for i := 1; i < n; i++ {
            if nums[i] > nums[i-1] {
                return false
            }
        }
    }
    return true
}
