func countGoodNumbers(n int64) int {
    const mod int64 = 1000000007
    evenPositions := (n + 1) / 2
    oddPositions := n / 2
    
    evenWays := chakraPower(5, evenPositions, mod)
    oddWays := chakraPower(4, oddPositions, mod)
    
    return int((evenWays * oddWays) % mod)
}

func chakraPower(base, power, mod int64) int64 {
    result := int64(1)
    b := base % mod
    p := power
    for p > 0 {
        if p%2 == 1 {
            result = (result * b) % mod
        }
        b = (b * b) % mod
        p /= 2
    }
    return result
}
