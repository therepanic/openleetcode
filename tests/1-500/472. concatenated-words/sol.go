func findAllConcatenatedWordsInADict(words []string) []string {
    res := []string{}
    wordSet := make(map[string]bool)
    incorrect := make(map[string]bool)
    
    for _, word := range words {
        wordSet[word] = true
    }
    
    var dfs func(string) bool
    dfs = func(word string) bool {
        if wordSet[word] {
            return true
        }
        if incorrect[word] {
            return false
        }
        
        for i := 1; i < len(word); i++ {
            prefix := word[:i]
            if wordSet[prefix] {
                suffix := word[i:]
                if dfs(suffix) {
                    return true
                } else {
                    incorrect[suffix] = true
                }
            }
        }
        
        incorrect[word] = true
        return false
    }
    
    for _, word := range words {
        delete(wordSet, word)
        if dfs(word) {
            res = append(res, word)
        }
        wordSet[word] = true
    }
    
    return res
}
