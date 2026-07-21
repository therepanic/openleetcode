func numSub(s string) int {
    cnt := 0
    total := 0
    mod := 1000000007
    for _, a := range s {
        if a == '1' {
            cnt++
        } else {
            cnt = 0
        }
        total = (total + cnt) % mod
    }
    return total
}
