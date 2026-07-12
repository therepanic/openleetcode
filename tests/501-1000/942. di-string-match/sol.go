func diStringMatch(s string) []int {
    low, high := 0, len(s)
    result := make([]int, len(s)+1)
    for i, c := range s {
        if c == 'I' {
            result[i] = low
            low++
        } else {
            result[i] = high
            high--
        }
    }
    result[len(s)] = low
    return result
}
