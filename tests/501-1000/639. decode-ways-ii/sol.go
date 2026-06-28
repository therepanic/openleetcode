func numDecodings(s string) int {
    M := 1000000007
    n := len(s) - 1
    
    d := make(map[string]int)
    for i := 1; i <= 26; i++ {
        d[strconv.Itoa(i)] = 1
    }
    for i := 0; i <= 9; i++ {
        val := 1
        if i < 7 {
            val = 2
        }
        d["*"+strconv.Itoa(i)] = val
    }
    d["*"] = 9
    d["**"] = 15
    d["1*"] = 9
    d["2*"] = 6
    
    dp := make([]int64, n+2)
    dp[0] = int64(d[string(s[0])])
    dp[n+1] = 1
    
    for i := 0; i < n; i++ {
        one := string(s[i+1])
        two := string(s[i]) + string(s[i+1])
        
        count := (int64(d[one]) * dp[i]) % int64(M)
        prev := int64(1)
        if i > 0 {
            prev = dp[i-1]
        }
        count = (count + int64(d[two])*prev) % int64(M)
        dp[i+1] = count
        
        if dp[i+1] == 0 {
            return 0
        }
    }
    
    return int(dp[n])
}
