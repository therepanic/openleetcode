func lengthOfLIS(nums []int) int {
    prevIdx := -1
    dp := make([][]int, 2500)
    for i := 0; i < 2500; i++ {
        dp[i] = make([]int, 2500)
        for j := 0; j < 2500; j++ {
            dp[i][j] = -1
        }
    }
    return helper(0, prevIdx, nums, dp)
}

func helper(i int, prevIdx int, nums []int, dp [][]int) int {
    if i >= len(nums) {
        return 0
    }
    if dp[i][prevIdx+1] != -1 {
        return dp[i][prevIdx+1]
    }
    steal := 0
    skip := 0
    if prevIdx == -1 || nums[prevIdx] < nums[i] {
        steal = 1 + helper(i+1, i, nums, dp)
    }
    skip = helper(i+1, prevIdx, nums, dp)
    if steal > skip {
        dp[i][prevIdx+1] = steal
    } else {
        dp[i][prevIdx+1] = skip
    }
    return dp[i][prevIdx+1]
}
