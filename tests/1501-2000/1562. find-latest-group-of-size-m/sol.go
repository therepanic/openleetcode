func findLatestStep(arr []int, m int) int {
    n := len(arr)
    if m == n {
        return m
    }
    
    groups := make([]int, n+2)
    latestStep := -1
    
    for i, val := range arr {
        idx := val
        left := groups[idx-1]
        right := groups[idx+1]
        
        if left == m || right == m {
            latestStep = i
        }
        
        size := left + right + 1
        groups[idx-left] = size
        groups[idx+right] = size
    }
    
    return latestStep
}
