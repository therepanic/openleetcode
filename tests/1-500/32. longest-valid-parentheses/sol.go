func longestValidParentheses(s string) int {
    st := []int{-1}
    ans := 0
    for i := 0; i < len(s); i++ {
        if s[i] == '(' {
            st = append(st, i)
        } else {
            st = st[:len(st)-1]
            if len(st) == 0 {
                st = append(st, i)
            } else if v := i - st[len(st)-1]; v > ans {
                ans = v
            }
        }
    }
    return ans
}
