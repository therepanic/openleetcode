func countConsistentStrings(allowed string, words []string) int {
    result := 0
    allowedSet := make(map[rune]bool)
    for _, c := range allowed {
        allowedSet[c] = true
    }
    for _, word := range words {
        allIn := true
        for _, c := range word {
            if !allowedSet[c] {
                allIn = false
                break
            }
        }
        if allIn {
            result++
        }
    }
    return result
}
