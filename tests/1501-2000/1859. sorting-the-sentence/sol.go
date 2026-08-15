func sortSentence(s string) string {
    words := make(map[int]string)
    for _, word := range strings.Split(s, " ") {
        key := int(word[len(word)-1] - '0')
        words[key] = word[:len(word)-1]
    }
    result := make([]string, 0, len(words))
    for i := 1; i <= 9; i++ {
        if word, ok := words[i]; ok {
            result = append(result, word)
        }
    }
    return strings.Join(result, " ")
}
