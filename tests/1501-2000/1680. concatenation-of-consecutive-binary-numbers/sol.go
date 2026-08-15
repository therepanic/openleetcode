func concatenatedBinary(n int) int {
    const MOD = 1000000007
    res := 0
    bits := 0

    for i := 1; i <= n; i++ {
        if (i & (i - 1)) == 0 {
            bits++
        }
        res = ((res << bits) | i) % MOD
    }

    return res
}
