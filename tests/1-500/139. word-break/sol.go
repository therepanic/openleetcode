func wordBreak(s string, wordDict []string) bool {
    words := make(map[string]bool, len(wordDict))
    maxLen := 0
    for _, word := range wordDict { words[word] = true; if len(word) > maxLen { maxLen = len(word) } }
    dp := make([]bool, len(s)+1)
    dp[len(s)] = true
    for i := len(s) - 1; i >= 0; i-- {
        for l := 1; l <= maxLen && i+l <= len(s); l++ {
            if words[s[i:i+l]] && dp[i+l] { dp[i] = true; break }
        }
    }
    return dp[0]
}
