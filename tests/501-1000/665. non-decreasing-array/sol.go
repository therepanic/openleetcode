func checkPossibility(nums []int) bool {
    cntViolations := 0
    for i := 1; i < len(nums); i++ {
        if nums[i] < nums[i-1] {
            if cntViolations == 1 {
                return false
            }
            cntViolations++
            if i >= 2 && nums[i-2] > nums[i] {
                nums[i] = nums[i-1]
            }
        }
    }
    return true
}
