func magicalString(n int) int {
    if n <= 0 {
        return 0
    }
    if n <= 3 {
        return 1
    }
    s := []int{1, 2, 2}
    i := 2
    for len(s) < n {
        nextVal := 3 - s[len(s)-1]
        count := s[i]
        for j := 0; j < count && len(s) < n; j++ {
            s = append(s, nextVal)
        }
        i++
    }
    ones := 0
    for j := 0; j < n; j++ {
        if s[j] == 1 {
            ones++
        }
    }
    return ones
}
