func movesToStamp(stamp string, target string) []int {
    m := len(stamp)
    n := len(target)
    stampArr := []byte(stamp)
    targetArr := []byte(target)
    
    canStamp := func(i int) bool {
        for j := 0; j < m; j++ {
            if targetArr[i+j] != '?' && targetArr[i+j] != stampArr[j] {
                return false
            }
        }
        return true
    }
    
    applyStamp := func(i int) {
        for j := 0; j < m; j++ {
            targetArr[i+j] = '?'
        }
    }
    
    stamped := make([]bool, n)
    result := make([]int, 0)
    queue := make([]int, 0)
    
    for i := 0; i <= n-m; i++ {
        if canStamp(i) {
            applyStamp(i)
            queue = append(queue, i)
            result = append(result, i)
            stamped[i] = true
        }
    }
    
    for len(queue) > 0 {
        pos := queue[0]
        queue = queue[1:]
        start := 0
        if pos-m+1 > start {
            start = pos - m + 1
        }
        end := n - m
        if pos+m < end {
            end = pos + m
        }
        for i := start; i <= end; i++ {
            if canStamp(i) {
                if !stamped[i] {
                    applyStamp(i)
                    queue = append(queue, i)
                    result = append(result, i)
                    stamped[i] = true
                }
            }
        }
    }
    
    for _, c := range targetArr {
        if c != '?' {
            return []int{}
        }
    }
    
    for i, j := 0, len(result)-1; i < j; i, j = i+1, j-1 {
        result[i], result[j] = result[j], result[i]
    }
    return result
}
