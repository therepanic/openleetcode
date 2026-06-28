func letterCasePermutation(s string) []string {
    var ans []string
    var solve func(int, []byte)
    solve = func(idx int, curr []byte) {
        if idx == len(s) {
            ans = append(ans, string(curr))
            return
        }
        if s[idx] >= '0' && s[idx] <= '9' {
            curr = append(curr, s[idx])
            solve(idx+1, curr)
            return
        }
        lower := s[idx]
        if lower >= 'A' && lower <= 'Z' {
            lower = lower + 32
        }
        curr = append(curr, lower)
        solve(idx+1, curr)
        curr = curr[:len(curr)-1]
        
        upper := s[idx]
        if upper >= 'a' && upper <= 'z' {
            upper = upper - 32
        }
        curr = append(curr, upper)
        solve(idx+1, curr)
    }
    solve(0, []byte{})
    return ans
}
