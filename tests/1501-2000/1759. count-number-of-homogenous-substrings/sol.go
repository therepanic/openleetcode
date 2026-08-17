func countHomogenous(s string) int {
    mod := int64(1000000007)
    n := len(s)
    res := int64(1)
    cnt := 1
    for i := 1; i < n; i++ {
        if s[i] != s[i-1] {
            cnt = 0
        }
        cnt++
        res = (res + int64(cnt)) % mod
    }
    return int(res)
}
