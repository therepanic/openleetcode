func minIncrementForUnique(nums []int) int {
    sort.Ints(nums)
    res := 0
    for i := 1; i < len(nums); i++ {
        if nums[i] <= nums[i-1] {
            target := nums[i-1] + 1
            res += target - nums[i]
            nums[i] = target
        }
    }
    return res
}
