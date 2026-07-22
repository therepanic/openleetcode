func maxFreq(s string, maxLetters int, minSize int, maxSize int) int {
    count := make(map[string]int)
    unique := make(map[byte]int)
    left := 0
    res := 0
    for right := 0; right < len(s); right++ {
        unique[s[right]]++

        for len(unique) > maxLetters || right-left+1 > minSize {
            unique[s[left]]--
            if unique[s[left]] == 0 {
                delete(unique, s[left])
            }
            left++
        }

        if right-left+1 == minSize && len(unique) <= maxLetters {
            curr := s[left : right+1]
            count[curr]++
            if count[curr] > res {
                res = count[curr]
            }
        }
    }
    return res
}
