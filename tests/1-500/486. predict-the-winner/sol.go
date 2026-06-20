func predictTheWinner(nums []int) bool {
    var helper func(int, int) int
    helper = func(left, right int) int {
        if left == right {
            return nums[left]
        }
        return max(nums[left] - helper(left + 1, right), 
                  nums[right] - helper(left, right - 1))
    }
    return helper(0, len(nums) - 1) >= 0
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
