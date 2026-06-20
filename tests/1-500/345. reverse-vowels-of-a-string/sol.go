func reverseVowels(s string) string {
    vowels := "aeiouAEIOU"
    chars := []rune(s)
    i, j := 0, len(chars)-1
    for i < j {
        for i < j && !strings.ContainsRune(vowels, chars[i]) {
            i++
        }
        for i < j && !strings.ContainsRune(vowels, chars[j]) {
            j--
        }
        chars[i], chars[j] = chars[j], chars[i]
        i++
        j--
    }
    return string(chars)
}
