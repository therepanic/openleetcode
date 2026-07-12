func smallestRangeII(nums []int, k int) int {
    sort.Ints(nums)
    n := len(nums)
    ans := nums[n-1] - nums[0]
    for i := 0; i < n-1; i++ {
        high := max(nums[n-1]-k, nums[i]+k)
        low := min(nums[0]+k, nums[i+1]-k)
        ans = min(ans, high-low)
    }
    return ans
}
