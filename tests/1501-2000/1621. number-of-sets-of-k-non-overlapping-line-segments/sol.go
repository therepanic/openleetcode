func numberOfSets(n int, k int) int {
    const MOD = 1000000007
    dpPrev := make([]int64, n)
    for i := 0; i < n; i++ {
        dpPrev[i] = 1
    }
    
    prefixPrev := make([]int64, n)
    prefixPrev[0] = dpPrev[0]
    for i := 1; i < n; i++ {
        prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD
    }
    
    for iter := 0; iter < k; iter++ {
        dpCur := make([]int64, n)
        for i := 1; i < n; i++ {
            dpCur[i] = (dpCur[i-1] + prefixPrev[i-1]) % MOD
        }
        dpPrev = dpCur
        prefixPrev[0] = dpPrev[0]
        for i := 1; i < n; i++ {
            prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD
        }
    }
    
    return int(dpPrev[n-1])
}
