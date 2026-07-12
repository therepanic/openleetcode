type Solution struct{}

func (Solution) UncommonFromSentences(s1 string, s2 string) []string {
    return uncommonFromSentences(s1, s2)
}

func uncommonFromSentences(s1 string, s2 string) []string {
    words := splitWords(s1)
    words = append(words, splitWords(s2)...)
    count := make(map[string]int)
    for _, word := range words {
        count[word]++
    }
    result := make([]string, 0)
    for word, c := range count {
        if c == 1 {
            result = append(result, word)
        }
    }
    return result
}

func splitWords(s string) []string {
    words := make([]string, 0)
    start := -1
    for i := 0; i <= len(s); i++ {
        if i < len(s) && s[i] != ' ' {
            if start == -1 {
                start = i
            }
            continue
        }
        if start != -1 {
            words = append(words, s[start:i])
            start = -1
        }
    }
    return words
}
