func maxNiceDivisors(primeFactors int) int {
    const MOD = 1_000_000_007
    if primeFactors == 1 {
        return 1
    }
    q := primeFactors / 3
    r := primeFactors % 3
    pow := func(a, b int64) int64 {
        res := int64(1)
        for b > 0 {
            if b%2 == 1 {
                res = res * a % MOD
            }
            a = a * a % MOD
            b /= 2
        }
        return res
    }
    if r == 0 {
        return int(pow(3, int64(q)))
    } else if r == 1 {
        return int(pow(3, int64(q-1)) * 4 % MOD)
    } else {
        return int(pow(3, int64(q)) * 2 % MOD)
    }
}
