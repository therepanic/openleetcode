func maxPower(s string) int {
    maxcnt := 0
    cnt := 0
    for i := 1; i < len(s); i++ {
        if s[i] == s[i-1] {
            cnt++
        } else {
            cnt = 0
        }
        if cnt > maxcnt {
            maxcnt = cnt
        }
    }
    return maxcnt + 1
}
