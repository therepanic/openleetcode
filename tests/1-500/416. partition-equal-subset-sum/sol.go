func canPartition(nums []int) bool {
    totalSum := 0
    for _, num := range nums {
        totalSum += num
    }
    if totalSum%2 != 0 {
        return false
    }
    targetSum := totalSum / 2
    dp := make([]bool, targetSum+1)
    dp[0] = true
    for _, num := range nums {
        for currSum := targetSum; currSum >= num; currSum-- {
            dp[currSum] = dp[currSum] || dp[currSum-num]
        }
    }
    return dp[targetSum]
}
