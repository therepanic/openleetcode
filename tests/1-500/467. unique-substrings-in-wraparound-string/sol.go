func findSubstringInWraproundString(s string) int {
    counts := make([]int, 26)
    maxLen := 0

    for i := 0; i < len(s); i++ {
        if i > 0 && (s[i] - s[i-1] + 26) % 26 == 1 {
            maxLen++
        } else {
            maxLen = 1
        }
        idx := s[i] - 'a'
        if counts[idx] < maxLen {
            counts[idx] = maxLen
        }
    }

    sum := 0
    for _, v := range counts {
        sum += v
    }
    return sum
}
