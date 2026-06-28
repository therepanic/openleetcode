func findRotateSteps(ring string, key string) int {
    dist := func(size, p, t int) int {
        a := t - p
        if a < 0 {
            a = -a
        }
        b := size - a
        if a < b {
            return a
        }
        return b
    }
    
    mp := make([][100]int, 26)
    freq := make([]int, 26)
    dp := make([][100]int, 100)
    
    n, m := len(ring), len(key)
    
    for i := 0; i < n; i++ {
        idx := int(ring[i] - 'a')
        mp[idx][freq[idx]] = i
        freq[idx]++
    }
    
    firstChar := int(key[0] - 'a')
    for i := 0; i < freq[firstChar]; i++ {
        dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1
    }
    
    for i := 1; i < m; i++ {
        prevChar := int(key[i-1] - 'a')
        currChar := int(key[i] - 'a')
        for j := 0; j < freq[currChar]; j++ {
            mini := int(^uint(0) >> 1) // max int
            for k := 0; k < freq[prevChar]; k++ {
                val := dp[i-1][mp[prevChar][k]] + dist(n, mp[currChar][j], mp[prevChar][k]) + 1
                if val < mini {
                    mini = val
                }
            }
            dp[i][mp[currChar][j]] = mini
        }
    }
    
    lastChar := int(key[m-1] - 'a')
    res := int(^uint(0) >> 1)
    for i := 0; i < freq[lastChar]; i++ {
        if dp[m-1][mp[lastChar][i]] < res {
            res = dp[m-1][mp[lastChar][i]]
        }
    }
    
    return res
}
