func maxUniqueSplit(s string) int {
    used := make(map[string]bool)
    ans := 0
    var backtrack func(int)
    backtrack = func(index int) {
        if index == len(s) {
            if len(used) > ans {
                ans = len(used)
            }
            return
        }
        for j := index; j < len(s); j++ {
            curr := s[index : j+1]
            if used[curr] {
                continue
            }
            used[curr] = true
            backtrack(j + 1)
            delete(used, curr)
        }
    }
    backtrack(0)
    return ans
}
