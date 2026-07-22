func printVertically(s string) []string {
    words := strings.Split(s, " ")
    maxLen := 0
    for _, word := range words {
        if len(word) > maxLen {
            maxLen = len(word)
        }
    }
    res := make([]string, 0, maxLen)
    for i := 0; i < maxLen; i++ {
        var currWord strings.Builder
        for _, word := range words {
            if i < len(word) {
                currWord.WriteByte(word[i])
            } else {
                currWord.WriteByte(' ')
            }
        }
        str := currWord.String()
        str = strings.TrimRight(str, " ")
        res = append(res, str)
    }
    return res
}
