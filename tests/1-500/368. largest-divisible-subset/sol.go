import "sort"

func largestDivisibleSubset(nums []int) []int {
    sort.Ints(nums)
    n := len(nums)
    dp := make([]int, n)
    prev := make([]int, n)
    for i := range dp {
        dp[i] = 1
        prev[i] = -1
    }
    maxi := 0
    for i := 1; i < n; i++ {
        for j := 0; j < i; j++ {
            if nums[i] % nums[j] == 0 && dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
                prev[i] = j
            }
        }
        if dp[i] > dp[maxi] {
            maxi = i
        }
    }
    res := []int{}
    for i := maxi; i >= 0; i = prev[i] {
        res = append(res, nums[i])
    }
    for i, j := 0, len(res)-1; i < j; i, j = i+1, j-1 {
        res[i], res[j] = res[j], res[i]
    }
    return res
}
