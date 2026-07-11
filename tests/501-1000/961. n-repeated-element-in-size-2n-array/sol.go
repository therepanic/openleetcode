func repeatedNTimes(nums []int) int {
    n := len(nums) - 2
    for i := 0; i < n; i++ {
        if nums[i] == nums[i+1] || nums[i] == nums[i+2] {
            return nums[i]
        }
    }
    return nums[n+1]
}
