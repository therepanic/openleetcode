func superPow(a int, b []int) int {
    a %= 1337
    result := 1
    for _, d := range b {
        result = (powMod(result, 10, 1337) * powMod(a, d, 1337)) % 1337
    }
    return result
}

func powMod(x, n, mod int) int {
    res := 1
    x %= mod
    for n > 0 {
        if n&1 == 1 {
            res = (res * x) % mod
        }
        x = (x * x) % mod
        n >>= 1
    }
    return res
}
