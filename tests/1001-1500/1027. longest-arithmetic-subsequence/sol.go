func longestArithSeqLength(nums []int) int {
    n := len(nums)
    if n <= 2 {
        return n
    }
    dp := make([]map[int]int, n)
    for i := 0; i < n; i++ {
        dp[i] = make(map[int]int)
    }
    ans := 2
    for i := 0; i < n; i++ {
        for j := 0; j < i; j++ {
            d := nums[i] - nums[j]
            prev := dp[j][d]
            if prev == 0 {
                prev = 1
            }
            if prev+1 > dp[i][d] {
                dp[i][d] = prev + 1
            }
            if dp[i][d] > ans {
                ans = dp[i][d]
            }
        }
    }
    return ans
}
