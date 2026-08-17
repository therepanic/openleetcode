func makeEqual(words []string) bool {
    freq := [26]int{}
    n := len(words)
    for _, word := range words {
        for _, ch := range word {
            freq[ch-'a']++
        }
    }
    for _, count := range freq {
        if count%n != 0 {
            return false
        }
    }
    return true
}
