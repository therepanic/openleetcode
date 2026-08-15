func minNonZeroProduct(p int) int {
    const mod = 1000000007
    maxNum := (int64(1) << p) - 1
    count := (int64(1) << (p - 1)) - 1
    
    powMod := func(x, n int64) int64 {
        x %= mod
        result := int64(1)
        for n > 0 {
            if n&1 == 1 {
                result = (result * x) % mod
            }
            x = (x * x) % mod
            n >>= 1
        }
        return result
    }
    
    ans := powMod(maxNum-1, count) * (maxNum % mod) % mod
    return int(ans)
}
