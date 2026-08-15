func maxTaxiEarnings(n int, rides [][]int) int64 {
    sort.Slice(rides, func(i, j int) bool {
        return rides[i][1] < rides[j][1]
    })
    
    dp := [][]int64{{0, 0}}
    
    for _, ride := range rides {
        start, end, tip := int64(ride[0]), int64(ride[1]), int64(ride[2])
        
        lo, hi := 0, len(dp)
        for lo < hi {
            mid := lo + (hi-lo)/2
            if dp[mid][0] <= start {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        i := lo - 1
        profit := dp[i][1] + end - start + tip
        
        if profit > dp[len(dp)-1][1] {
            dp = append(dp, []int64{end, profit})
        }
    }
    
    return dp[len(dp)-1][1]
}
