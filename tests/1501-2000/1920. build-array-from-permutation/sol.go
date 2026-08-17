func buildArray(nums []int) []int {
    for i := 0; i < len(nums); i++ {
        nums[i] += (1024 * (nums[nums[i]] % 1024))
    }
    
    for i := 0; i < len(nums); i++ {
        nums[i] /= 1024
    }
    
    return nums
}
