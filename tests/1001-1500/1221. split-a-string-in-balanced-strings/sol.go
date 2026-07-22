func balancedStringSplit(s string) int {
    bal := 0
    count := 0
    for _, c := range s {
        if c == 'L' {
            bal++
        } else if c == 'R' {
            bal--
        }
        if bal == 0 {
            count++
        }
    }
    return count
}
