func findTargetSumWays(nums []int, target int) int {
    total := 0
    for _, num := range nums {
        total += num
    }
    if abs(target) > total || (target + total) % 2 != 0 {
        return 0
    }
    sum := (target + total) / 2
    dp := make([]int, sum + 1)
    dp[0] = 1

    for _, num := range nums {
        for j := sum; j >= num; j-- {
            dp[j] += dp[j - num]
        }
    }

    return dp[sum]
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
