func sortArrayByParityII(nums []int) []int {
    i, j := 0, 1
    n := len(nums)
    
    for i < n && j < n {
        if nums[i] % 2 == 0 {
            i += 2
        } else if nums[j] % 2 == 1 {
            j += 2
        } else {
            nums[i], nums[j] = nums[j], nums[i]
            i += 2
            j += 2
        }
    }
    return nums
}
