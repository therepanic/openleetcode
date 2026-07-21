func maxSumDivThree(nums []int) int {
    n := len(nums)
    minus := -(1 << 30)
    dp := [][]int{{0, 0, 0}, {0, minus, minus}}
    for i, x := range nums {
        x3 := x % 3
        for mod := 0; mod < 3; mod++ {
            modPrev := (3 + mod - x3) % 3
            take := x + dp[(i+1)&1][modPrev]
            skip := dp[(i+1)&1][mod]
            if take > skip {
                dp[i&1][mod] = take
            } else {
                dp[i&1][mod] = skip
            }
        }
    }
    ans := dp[(n-1)&1][0]
    if ans < 0 {
        return 0
    }
    return ans
}
