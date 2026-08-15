func reorderSpaces(text string) string {
    words := strings.Fields(text)
    total := strings.Count(text, " ")
    if len(words) == 1 {
        return words[0] + strings.Repeat(" ", total)
    }
    gap := total / (len(words) - 1)
    extra := total % (len(words) - 1)
    return strings.Join(words, strings.Repeat(" ", gap)) + strings.Repeat(" ", extra)
}
