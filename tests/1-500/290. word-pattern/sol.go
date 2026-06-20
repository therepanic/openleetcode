func wordPattern(pattern string, s string) bool {
    words := strings.Split(s, " ")
    if len(pattern) != len(words) {
        return false
    }
    
    patternSet := make(map[byte]bool)
    wordSet := make(map[string]bool)
    pairSet := make(map[string]bool)
    
    for i := 0; i < len(pattern); i++ {
        patternSet[pattern[i]] = true
        wordSet[words[i]] = true
        pairSet[string(pattern[i])+","+words[i]] = true
    }
    
    return len(patternSet) == len(wordSet) && len(wordSet) == len(pairSet)
}
