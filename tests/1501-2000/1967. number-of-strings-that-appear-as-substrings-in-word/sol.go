func numOfStrings(patterns []string, word string) int {
    count := 0
    for _, s := range patterns {
        if strings.Contains(word, s) {
            count++
        }
    }
    return count
}
