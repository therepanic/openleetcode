func stringMatching(words []string) []string {
    n := len(words)
    ans := []string{}
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if i != j && strings.Contains(words[j], words[i]) {
                ans = append(ans, words[i])
                break
            }
        }
    }
    return ans
}
