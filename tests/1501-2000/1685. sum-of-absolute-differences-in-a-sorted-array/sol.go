func getSumAbsoluteDifferences(nums []int) []int {
    n := len(nums)
    pref := make([]int, n)
    pref[0] = nums[0]
    for i := 1; i < n; i++ {
        pref[i] = pref[i-1] + nums[i]
    }
    ans := make([]int, n)
    for i := 0; i < n; i++ {
        left := 0
        if i > 0 { left = pref[i-1] }
        right := pref[n-1] - pref[i]
        ans[i] = right - left + (2*i - n + 1) * nums[i]
    }
    return ans
}
