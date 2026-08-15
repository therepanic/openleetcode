func minimumDifference(nums []int, k int) int {
    sort.Ints(nums)
    n := len(nums)
    ans := nums[k-1] - nums[0]
    for i := 0; i <= n-k; i++ {
        if nums[i+k-1]-nums[i] < ans {
            ans = nums[i+k-1] - nums[i]
        }
    }
    return ans
}
