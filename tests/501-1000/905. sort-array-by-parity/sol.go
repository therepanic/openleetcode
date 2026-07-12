func sortArrayByParity(nums []int) []int {
    left := 0
    for i := 0; i < len(nums); i++ {
        if nums[i] % 2 == 0 {
            nums[left], nums[i] = nums[i], nums[left]
            left++
        }
    }
    return nums
}
