func reversePrefix(word string, ch byte) string {
    idx := -1
    for i := 0; i < len(word); i++ {
        if word[i] == ch {
            idx = i
            break
        }
    }
    if idx == -1 {
        return word
    }
    runes := []byte(word)
    for i, j := 0, idx; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}
