func commonChars(words []string) []string {
    freq := make(map[rune]int)
    for _, c := range words[0] {
        freq[c]++
    }
    for i := 1; i < len(words); i++ {
        f := make(map[rune]int)
        for _, c := range words[i] {
            f[c]++
        }
        for c := range freq {
            if count, ok := f[c]; ok {
                if count < freq[c] {
                    freq[c] = count
                }
            } else {
                freq[c] = 0
            }
        }
    }
    res := make([]string, 0)
    for c := 'a'; c <= 'z'; c++ {
        count, ok := freq[c]
        if !ok || count == 0 {
            continue
        }
        for j := 0; j < count; j++ {
            res = append(res, string(c))
        }
    }
    return res
}
