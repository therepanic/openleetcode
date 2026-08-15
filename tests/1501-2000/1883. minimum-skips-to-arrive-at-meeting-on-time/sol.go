func minSkips(dist []int, speed int, hoursBefore int) int {
    inf := int64(1e18)
    n := len(dist)
    dp := make([]int64, n+1)
    for i := range dp {
        dp[i] = inf
    }
    dp[0] = 0
    for i, d := range dist {
        nxt := make([]int64, n+1)
        for j := range nxt {
            nxt[j] = inf
        }
        for skips := 0; skips <= i+1; skips++ {
            if dp[skips] >= inf {
                continue
            }
            if nxt[skips+1] > dp[skips]+int64(d) {
                nxt[skips+1] = dp[skips] + int64(d)
            }
            arrival := dp[skips] + int64(d)
            if i != n-1 {
                arrival = ((arrival+int64(speed)-1)/int64(speed))*int64(speed)
            }
            if nxt[skips] > arrival {
                nxt[skips] = arrival
            }
        }
        dp = nxt
    }
    limit := int64(hoursBefore) * int64(speed)
    for skips, v := range dp {
        if v <= limit {
            return skips
        }
    }
    return -1
}
