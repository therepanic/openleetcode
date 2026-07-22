func minStartValue(nums []int) int {
    curr, ans := 0, 0
    for _, i := range nums {
        curr += i
        if curr < ans {
            ans = curr
        }
    }
    if ans > 1-ans {
        return ans
    }
    return 1 - ans
}
