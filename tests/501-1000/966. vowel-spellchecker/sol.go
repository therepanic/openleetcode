func spellchecker(wordlist []string, queries []string) []string {
    exact := make(map[string]bool)
    caseMap := make(map[string]string)
    vowelMap := make(map[string]string)
    
    for _, w := range wordlist {
        exact[w] = true
        lower := strings.ToLower(w)
        devowel := deVowel(lower)
        if _, ok := caseMap[lower]; !ok {
            caseMap[lower] = w
        }
        if _, ok := vowelMap[devowel]; !ok {
            vowelMap[devowel] = w
        }
    }
    
    result := make([]string, len(queries))
    for i, q := range queries {
        if exact[q] {
            result[i] = q
        } else {
            lower := strings.ToLower(q)
            devowel := deVowel(lower)
            if v, ok := caseMap[lower]; ok {
                result[i] = v
            } else if v, ok := vowelMap[devowel]; ok {
                result[i] = v
            } else {
                result[i] = ""
            }
        }
    }
    return result
}

func deVowel(s string) string {
    vowels := "aeiou"
    result := []byte(s)
    for i := 0; i < len(result); i++ {
        for _, v := range vowels {
            if rune(result[i]) == v {
                result[i] = '*'
                break
            }
        }
    }
    return string(result)
}
