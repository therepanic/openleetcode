func shortestCompletingWord(licensePlate string, words []string) string {
    lp := make([]int, 26)
    for _, c := range strings.ToLower(licensePlate) {
        if unicode.IsLetter(c) {
            lp[c - 'a']++
        }
    }
    var ans string
    for _, w := range words {
        cw := make([]int, 26)
        for _, c := range w {
            cw[c - 'a']++
        }
        ok := true
        for i := 0; i < 26; i++ {
            if cw[i] < lp[i] {
                ok = false
                break
            }
        }
        if ok && (ans == "" || len(w) < len(ans)) {
            ans = w
        }
    }
    return ans
}
