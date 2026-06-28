func minStickers(stickers []string, target string) int {
    memo := make(map[string]int)
    var dfs func(int, string) int
    dfs = func(idx int, target string) int {
        if target == "" {
            return 0
        }
        if idx == len(stickers) {
            return int(^uint(0) >> 1) // max int
        }
        
        key := fmt.Sprintf("%d,%s", idx, target)
        if val, ok := memo[key]; ok {
            return val
        }
        
        result := dfs(idx+1, target)
        
        currentSticker := stickers[idx]
        newTarget := []byte(target)
        somethingRemoved := false
        for _, c := range currentSticker {
            for i, ch := range newTarget {
                if ch == byte(c) {
                    newTarget = append(newTarget[:i], newTarget[i+1:]...)
                    somethingRemoved = true
                    break
                }
            }
        }
        
        if somethingRemoved {
            subResult := dfs(idx, string(newTarget))
            if subResult != int(^uint(0)>>1) && 1+subResult < result {
                result = 1 + subResult
            }
        }
        
        memo[key] = result
        return result
    }
    
    result := dfs(0, target)
    if result == int(^uint(0)>>1) {
        return -1
    }
    return result
}
