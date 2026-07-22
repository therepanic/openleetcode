func maxDotProduct(nums1 []int, nums2 []int) int {
    memo := make([][]int, len(nums1))
    for i := range memo {
        memo[i] = make([]int, len(nums2))
        for j := range memo[i] {
            memo[i][j] = math.MinInt32
        }
    }
    
    var dp func(i, j int) int
    dp = func(i, j int) int {
        if i == len(nums1) || j == len(nums2) {
            return math.MinInt32
        }
        if memo[i][j] != math.MinInt32 {
            return memo[i][j]
        }
        
        take := nums1[i] * nums2[j]
        res := take
        takeAndContinue := dp(i+1, j+1)
        if takeAndContinue != math.MinInt32 {
            res = max(res, take + takeAndContinue)
        }
        res = max(res, dp(i+1, j))
        res = max(res, dp(i, j+1))
        
        memo[i][j] = res
        return res
    }
    
    return dp(0, 0)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
