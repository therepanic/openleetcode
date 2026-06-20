func wordBreak(s string, wordDict []string) []string {
    words := make(map[string]bool, len(wordDict))
    for _, word := range wordDict { words[word] = true }
    memo := make(map[string][]string)
    var solve func(string) []string
    solve = func(text string) []string {
        if found, ok := memo[text]; ok { return found }
        result := make([]string, 0)
        if words[text] { result = append(result, text) }
        for i := 1; i < len(text); i++ {
            prefix := text[:i]
            if !words[prefix] { continue }
            for _, tail := range solve(text[i:]) { result = append(result, prefix+" "+tail) }
        }
        memo[text] = result
        return result
    }
    return solve(s)
}
