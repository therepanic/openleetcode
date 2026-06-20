func numberOfArithmeticSlices(nums []int) int {
    n := len(nums)
    totalCount := 0
    dp := make([]map[int]int, n)
    for i := range dp {
        dp[i] = make(map[int]int)
    }

    for i := 1; i < n; i++ {
        for j := 0; j < i; j++ {
            diff := nums[i] - nums[j]
            dp[i][diff]++
            if cnt, ok := dp[j][diff]; ok {
                dp[i][diff] += cnt
                totalCount += cnt
            }
        }
    }

    return totalCount
}
