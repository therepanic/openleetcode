func longestWPI(hours []int) int {
    score := 0
    longestInterval := 0
    seenAt := map[int]int{0: -1}
    
    for i, h := range hours {
        if h > 8 {
            score++
        } else {
            score--
        }
        
        if score > 0 {
            longestInterval = i + 1
        } else if idx, ok := seenAt[score-1]; ok {
            if i - idx > longestInterval {
                longestInterval = i - idx
            }
        }
        
        if _, ok := seenAt[score]; !ok {
            seenAt[score] = i
        }
    }
    
    return longestInterval
}
