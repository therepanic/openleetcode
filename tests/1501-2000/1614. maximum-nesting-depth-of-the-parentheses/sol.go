func maxDepth(s string) int {
    ctr := 0
    ans := 0
    for _, ch := range s {
        if ch == '(' {
            ctr++
            if ctr > ans {
                ans = ctr
            }
        } else if ch == ')' {
            ctr--
        }
    }
    return ans
}
