func mostCommonWord(paragraph string, banned []string) string {
    bannedSet := make(map[string]bool)
    for _, w := range banned {
        bannedSet[w] = true
    }
    counts := make(map[string]int)
    re := regexp.MustCompile(`[a-z]+`)
    words := re.FindAllString(strings.ToLower(paragraph), -1)
    for _, w := range words {
        if !bannedSet[w] {
            counts[w]++
        }
    }
    maxCount := 0
    result := ""
    for w, c := range counts {
        if c > maxCount {
            maxCount = c
            result = w
        }
    }
    return result
}
