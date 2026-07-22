func minTaps(n int, ranges []int) int {
    maxRange := make([]int, n+1)
    
    for i := 0; i < len(ranges); i++ {
        left := max(0, i - ranges[i])
        right := min(n, i + ranges[i])
        maxRange[left] = max(maxRange[left], right)
    }
    
    end, farthest, taps := 0, 0, 0
    i := 0
    
    for end < n {
        for i <= end {
            farthest = max(farthest, maxRange[i])
            i++
        }
        
        if farthest <= end {
            return -1
        }
        
        end = farthest
        taps++
    }
    
    return taps
}
