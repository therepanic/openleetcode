func longestStrChain(words []string) int {
    chains := make(map[string]int)
    sort.Slice(words, func(i, j int) bool {
        return len(words[i]) < len(words[j])
    })
    
    for _, word := range words {
        chains[word] = 1
        for i := 0; i < len(word); i++ {
            pred := word[:i] + word[i+1:]
            if val, ok := chains[pred]; ok {
                if val+1 > chains[word] {
                    chains[word] = val + 1
                }
            }
        }
    }
    
    maxLen := 0
    for _, v := range chains {
        if v > maxLen {
            maxLen = v
        }
    }
    return maxLen
}
