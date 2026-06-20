func rob(nums []int) int {
    next1 := 0
    next2 := 0
    for i := len(nums) - 1; i >= 0; i-- {
        curr := next1
        if nums[i]+next2 > curr {
            curr = nums[i] + next2
        }
        next2 = next1
        next1 = curr
    }
    return next1
}
