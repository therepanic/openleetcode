func maximumScore(nums []int, k int) int {
    n := len(nums)
    i, j := k, k
    curMin := nums[k]
    res := curMin

    for i > 0 || j < n - 1 {
        if i == 0 {
            j++
        } else if j == n - 1 {
            i--
        } else if nums[i - 1] >= nums[j + 1] {
            i--
        } else {
            j++
        }
        curMin = min(curMin, nums[i], nums[j])
        res = max(res, curMin * (j - i + 1))
    }

    return res
}
