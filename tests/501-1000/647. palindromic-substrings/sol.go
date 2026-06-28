func countSubstrings(s string) int {
    count := 0
    
    expand := func(left, right int) int {
        res := 0
        for left >= 0 && right < len(s) && s[left] == s[right] {
            res++
            left--
            right++
        }
        return res
    }
    
    for i := 0; i < len(s); i++ {
        count += expand(i, i)
        count += expand(i, i+1)
    }
    
    return count
}
