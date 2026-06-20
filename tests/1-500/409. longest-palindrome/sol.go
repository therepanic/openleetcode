func longestPalindrome(s string) int {
    count := make(map[rune]int)
    for _, c := range s {
        count[c]++
    }
    
    maxLen := 0
    odd := false
    
    for _, freq := range count {
        if freq%2 == 0 {
            maxLen += freq
        } else {
            maxLen += freq - 1
            odd = true
        }
    }
    
    if odd {
        return maxLen + 1
    }
    return maxLen
}
