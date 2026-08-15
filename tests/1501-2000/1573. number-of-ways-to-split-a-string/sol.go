func numWays(s string) int {
    const MOD = 1000000007
    totalOnes := 0
    for _, ch := range s {
        if ch == '1' {
            totalOnes++
        }
    }
    
    if totalOnes == 0 {
        n := int64(len(s))
        return int(((n - 1) * (n - 2) / 2) % MOD)
    }
    
    if totalOnes%3 != 0 {
        return 0
    }
    
    onesPerPart := totalOnes / 3
    var firstSplitWays, secondSplitWays, count int64
    
    for _, ch := range s {
        if ch == '1' {
            count++
        }
        if count == int64(onesPerPart) {
            firstSplitWays++
        } else if count == int64(2*onesPerPart) {
            secondSplitWays++
        }
    }
    
    return int((firstSplitWays * secondSplitWays) % MOD)
}
