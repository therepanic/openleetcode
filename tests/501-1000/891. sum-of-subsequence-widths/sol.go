func sumSubseqWidths(nums []int) int {
    const mod = 1000000007
    sort.Ints(nums)
    n := len(nums)
    ans := 0
    factor := 1
    for i := 0; i < n; i++ {
        ans = (ans + (nums[i] - nums[n-1-i]) * factor) % mod
        factor = (factor * 2) % mod
    }
    return ans
}
