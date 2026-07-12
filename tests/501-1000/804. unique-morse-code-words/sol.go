func uniqueMorseRepresentations(words []string) int {
    storage := []string{
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
        "....", "..", ".---", "-.-", ".-..", "--", "-.",
        "---", ".--.", "--.-", ".-.", "...", "-", "..-",
        "...-", ".--", "-..-", "-.--", "--..",
    }

    st := make(map[string]bool)

    for _, word := range words {
        temp := ""
        for _, ch := range word {
            temp += storage[ch-'a']
        }
        st[temp] = true
    }

    return len(st)
}
