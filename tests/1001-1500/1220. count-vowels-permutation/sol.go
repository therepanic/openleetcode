func countVowelPermutation(n int) int {
    const MOD = 1000000007
    a, e, i, o, u := 1, 1, 1, 1, 1
    for k := 1; k < n; k++ {
        na := (e + i + u) % MOD
        ne := (a + i) % MOD
        ni := (e + o) % MOD
        no := i % MOD
        nu := (i + o) % MOD
        a, e, i, o, u = na, ne, ni, no, nu
    }
    return (a + e + i + o + u) % MOD
}
