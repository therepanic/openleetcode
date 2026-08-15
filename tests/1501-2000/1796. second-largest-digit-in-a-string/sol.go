func secondHighest(s string) int {
    digitSet := make(map[int]bool)
    for _, r := range s {
        if r >= '0' && r <= '9' {
            digitSet[int(r-'0')] = true
        }
    }
    if len(digitSet) > 1 {
        max := -1
        for d := range digitSet {
            if d > max {
                max = d
            }
        }
        delete(digitSet, max)
        secondMax := -1
        for d := range digitSet {
            if d > secondMax {
                secondMax = d
            }
        }
        return secondMax
    }
    return -1
}
