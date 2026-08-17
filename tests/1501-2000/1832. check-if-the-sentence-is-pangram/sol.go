func checkIfPangram(sentence string) bool {
    if len(sentence) < 26 {
        return false
    }
    
    for i := 0; i < 26; i++ {
        if !strings.ContainsRune(sentence, rune(97+i)) {
            return false
        }
    }
    return true
}
