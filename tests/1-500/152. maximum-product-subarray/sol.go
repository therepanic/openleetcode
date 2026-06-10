func maxProduct(nums []int) int {
    best := nums[0]
    curMax := nums[0]
    curMin := nums[0]
    for i := 1; i < len(nums); i++ {
        x := nums[i]
        if x < 0 {
            curMax, curMin = curMin, curMax
        }
        curMax = max152(x, curMax*x)
        curMin = min152(x, curMin*x)
        best = max152(best, curMax)
    }
    return best
}

func max152(a int, b int) int {
    if a > b {
        return a
    }
    return b
}

func min152(a int, b int) int {
    if a < b {
        return a
    }
    return b
}
