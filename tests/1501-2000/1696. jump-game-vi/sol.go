func maxResult(nums []int, k int) int {
    n := len(nums)
    dp := make([]int, n)
    dp[0] = nums[0]
    dq := []int{0}
    head := 0
    for i := 1; i < n; i++ {
        if dq[head] < i - k {
            head++
        }
        dp[i] = nums[i] + dp[dq[head]]
        for len(dq) > head && dp[dq[len(dq)-1]] <= dp[i] {
            dq = dq[:len(dq)-1]
        }
        dq = append(dq, i)
    }
    return dp[n-1]
}
