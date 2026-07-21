func createTargetArray(nums []int, index []int) []int {
    target := make([]int, 0, len(nums))
    for i := 0; i < len(nums); i++ {
        target = append(target, 0)
        copy(target[index[i]+1:], target[index[i]:])
        target[index[i]] = nums[i]
    }
    return target
}
