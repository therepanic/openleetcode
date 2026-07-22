func minDifference(nums []int) int {
    if len(nums) <= 3 {
        return 0
    }
    sort.Ints(nums)
    n := len(nums)
    return min(
        nums[n-4] - nums[0],
        nums[n-3] - nums[1],
        nums[n-2] - nums[2],
        nums[n-1] - nums[3],
    )
}

func min(a, b, c, d int) int {
    m := a
    if b < m {
        m = b
    }
    if c < m {
        m = c
    }
    if d < m {
        m = d
    }
    return m
}
