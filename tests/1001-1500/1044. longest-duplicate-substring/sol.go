func longestDupSubstring(s string) string {
    n := len(s)
    base1, base2 := 131, 31
    mod1, mod2 := int64(1000000005), int64(1000000007)

    h1, p1 := make([]int64, n+1), make([]int64, n+1)
    h2, p2 := make([]int64, n+1), make([]int64, n+1)
    p1[0], p2[0] = 1, 1

    for i := 0; i < n; i++ {
        h1[i+1] = (h1[i]*int64(base1) + int64(s[i])) % mod1
        p1[i+1] = (p1[i] * int64(base1)) % mod1
        h2[i+1] = (h2[i]*int64(base2) + int64(s[i])) % mod2
        p2[i+1] = (p2[i] * int64(base2)) % mod2
    }

    check := func(L int) string {
        seen := make(map[[2]int64]bool)
        for i := 0; i <= n-L; i++ {
            v1 := (h1[i+L] - h1[i]*p1[L]) % mod1
            if v1 < 0 {
                v1 += mod1
            }
            v2 := (h2[i+L] - h2[i]*p2[L]) % mod2
            if v2 < 0 {
                v2 += mod2
            }
            key := [2]int64{v1, v2}
            if seen[key] {
                return s[i : i+L]
            }
            seen[key] = true
        }
        return ""
    }

    lo, hi, res := 1, n, ""
    for lo <= hi {
        mid := (lo + hi) / 2
        t := check(mid)
        if t != "" {
            res = t
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return res
}
