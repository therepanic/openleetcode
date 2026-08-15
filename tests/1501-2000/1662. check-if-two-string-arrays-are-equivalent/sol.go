func arrayStringsAreEqual(word1 []string, word2 []string) bool {
    s1 := ""
    for _, w := range word1 {
        s1 += w
    }
    s2 := ""
    for _, w := range word2 {
        s2 += w
    }
    return s1 == s2
}
