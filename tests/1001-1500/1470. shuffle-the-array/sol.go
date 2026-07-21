func shuffle(nums []int, n int) []int {
    ans := make([]int, 2*n)
    for i := 0; i < 2*n; i++ {
        if i%2 == 0 {
            ans[i] = nums[i/2]
        } else {
            ans[i] = nums[n+i/2]
        }
    }
    return ans
}
