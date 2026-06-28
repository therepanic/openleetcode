func findErrorNums(nums []int) []int {
    i := 0
    for i < len(nums) {
        correct := nums[i] - 1
        if nums[i] != nums[correct] {
            nums[i], nums[correct] = nums[correct], nums[i]
        } else {
            i++
        }
    }
    
    for i := 0; i < len(nums); i++ {
        if nums[i] != i+1 {
            return []int{nums[i], i + 1}
        }
    }
    return []int{}
}
