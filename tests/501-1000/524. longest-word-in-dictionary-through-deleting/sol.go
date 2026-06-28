func findLongestWord(s string, dictionary []string) string {
    ans := ""
    for _, word := range dictionary {
        i, j := 0, 0
        for i < len(word) && j < len(s) {
            if word[i] == s[j] {
                i++
            }
            j++
        }
        if i == len(word) {
            if len(word) > len(ans) {
                ans = word
            } else if len(word) == len(ans) && word < ans {
                ans = word
            }
        }
    }
    return ans
}
