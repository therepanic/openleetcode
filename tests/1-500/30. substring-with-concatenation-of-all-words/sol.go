func findSubstring(s string, words []string) []int {
    ans := []int{}
    if len(s) == 0 || len(words) == 0 {
        return ans
    }

    wordLen := len(words[0])
    wordCount := len(words)
    target := make(map[string]int)
    for _, word := range words {
        target[word]++
    }

    for offset := 0; offset < wordLen; offset++ {
        left := offset
        right := offset
        used := 0
        window := make(map[string]int)

        for right+wordLen <= len(s) {
            word := s[right : right+wordLen]
            right += wordLen

            if _, ok := target[word]; ok {
                window[word]++
                used++
                for window[word] > target[word] {
                    leftWord := s[left : left+wordLen]
                    window[leftWord]--
                    left += wordLen
                    used--
                }
                if used == wordCount {
                    ans = append(ans, left)
                    leftWord := s[left : left+wordLen]
                    window[leftWord]--
                    left += wordLen
                    used--
                }
            } else {
                window = make(map[string]int)
                used = 0
                left = right
            }
        }
    }
    return ans
}
