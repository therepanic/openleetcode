func checkRecord(s string) bool {
    aCount := 0
    lStreak := 0
    
    for _, c := range s {
        if c == 'A' {
            aCount++
            if aCount >= 2 {
                return false
            }
        }
        if c == 'L' {
            lStreak++
            if lStreak >= 3 {
                return false
            }
        } else {
            lStreak = 0
        }
    }
    
    return true
}
