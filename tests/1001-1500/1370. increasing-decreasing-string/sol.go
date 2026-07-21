func sortString(s string) string {
    if len(s) == 0 {
        return ""
    }
    counts := make([]int, 26)
    for _, c := range s {
        counts[c-'a']++
    }
    ans := ""
    for {
        added := false
        for i := 0; i < 26; i++ {
            if counts[i] > 0 {
                ans += string(rune('a' + i))
                counts[i]--
                added = true
            }
        }
        for i := 25; i >= 0; i-- {
            if counts[i] > 0 {
                ans += string(rune('a' + i))
                counts[i]--
                added = true
            }
        }
        if !added {
            break
        }
    }
    return ans
}
