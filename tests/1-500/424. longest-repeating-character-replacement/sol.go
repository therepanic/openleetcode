func characterReplacement(s string, k int) int {
    maxCount := 0
    left := 0
    freq := make(map[byte]int)
    
    for right := 0; right < len(s); right++ {
        freq[s[right]]++
        if freq[s[right]] > maxCount {
            maxCount = freq[s[right]]
        }
        
        if right - left + 1 - maxCount > k {
            freq[s[left]]--
            left++
        }
    }
    
    return len(s) - left
}
