func mergeAlternately(word1 string, word2 string) string {
    merged := make([]byte, 0)
    minLen := len(word1)
    if len(word2) < minLen {
        minLen = len(word2)
    }
    for i := 0; i < minLen; i++ {
        merged = append(merged, word1[i], word2[i])
    }
    if len(word1) > minLen {
        merged = append(merged, word1[minLen:]...)
    }
    if len(word2) > minLen {
        merged = append(merged, word2[minLen:]...)
    }
    return string(merged)
}
