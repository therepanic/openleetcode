func maxUncrossedLines(nums1 []int, nums2 []int) int {
    m := len(nums1)
    n := len(nums2)
    dp := make([][]int, m+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
    }
    for i := 1; i <= m; i++ {
        for j := 1; j <= n; j++ {
            if nums1[i-1] == nums2[j-1] {
                dp[i][j] = 1 + dp[i-1][j-1]
            } else {
                if dp[i-1][j] > dp[i][j-1] {
                    dp[i][j] = dp[i-1][j]
                } else {
                    dp[i][j] = dp[i][j-1]
                }
            }
        }
    }
    return dp[m][n]
}
