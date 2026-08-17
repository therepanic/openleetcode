func splitString(s string) bool {
    var dfs func(index int, prev int64, count int) bool
    dfs = func(index int, prev int64, count int) bool {
        if index == len(s) {
            return count >= 2
        }
        
        var curr int64 = 0
        for i := index; i < len(s); i++ {
            curr = curr*10 + int64(s[i]-'0')
            if prev == -1 || prev-curr == 1 {
                if dfs(i+1, curr, count+1) {
                    return true
                }
            } else if curr >= prev && prev != -1 {
                break
            }
        }
        return false
    }
    
    return dfs(0, -1, 0)
}
