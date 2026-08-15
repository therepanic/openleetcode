func countMatches(items [][]string, ruleKey string, ruleValue string) int {
    keyMap := map[string]int{"type":0,"color":1,"name":2}
    count := 0
    idx := keyMap[ruleKey]
    for _, item := range items {
        if item[idx] == ruleValue {
            count++
        }
    }
    return count
}
