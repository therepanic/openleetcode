func numSubarrayBoundedMax(nums []int, left int, right int) int {
    res, dp, prev := 0, 0, -1
    for i, num := range nums {
        if num < left && i > 0 {
            res += dp
        }
        if num > right {
            dp = 0
            prev = i
        }
        if left <= num && num <= right {
            dp = i - prev
            res += dp
        }
    }
    return res
}
