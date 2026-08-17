func getConcatenation(nums []int) []int {
    n := len(nums)
    ans := make([]int, 2*n)
    for i := 0; i < 2*n; i++ {
        ans[i] = nums[i%n]
    }
    return ans
}
