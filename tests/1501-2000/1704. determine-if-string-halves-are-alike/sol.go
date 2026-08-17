func halvesAreAlike(s string) bool {
    vowels := "aeiouAEIOU"
    mid := len(s) / 2
    count := 0
    for i := 0; i < mid; i++ {
        if strings.ContainsRune(vowels, rune(s[i])) {
            count++
        }
    }
    for i := mid; i < len(s); i++ {
        if strings.ContainsRune(vowels, rune(s[i])) {
            count--
        }
    }
    return count == 0
}
