func toGoatLatin(sentence string) string {
    vowels := map[byte]bool{
        'a': true, 'e': true, 'i': true, 'o': true, 'u': true,
        'A': true, 'E': true, 'I': true, 'O': true, 'U': true,
    }
    words := strings.Split(sentence, " ")
    ans := []string{}
    for i, word := range words {
        goat := ""
        if vowels[word[0]] {
            goat = word + "ma"
        } else {
            goat = word[1:] + string(word[0]) + "ma"
        }
        goat += strings.Repeat("a", i+1)
        ans = append(ans, goat)
    }
    return strings.Join(ans, " ")
}
