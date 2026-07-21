func minimumSwap(s1 string, s2 string) int {
    n := len(s1)
    s1X := 0
    s1Y := 0
    for i := 0; i < n; i++ {
        if s1[i] == s2[i] {
            continue
        }
        if s1[i] == 'x' {
            s1X++
        } else {
            s1Y++
        }
    }

    if s1X%2 != s1Y%2 {
        return -1
    }

    swaps := s1X/2 + s1Y/2
    if s1X%2 == 0 {
        return swaps
    }
    return swaps + 2
}
