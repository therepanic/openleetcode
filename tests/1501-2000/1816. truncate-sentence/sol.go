func truncateSentence(s string, k int) string {
    words := strings.Split(s, " ")
    if k > len(words) {
        k = len(words)
    }
    return strings.Join(words[:k], " ")
}
