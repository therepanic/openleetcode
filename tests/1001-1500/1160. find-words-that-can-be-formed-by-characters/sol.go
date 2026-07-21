func countCharacters(words []string, chars string) int {
    ch := make(map[rune]int)
    for _, c := range chars {
        ch[c] = ch[c] + 1
    }
    
    res := 0
    for _, word := range words {
        copy := make(map[rune]int)
        for k, v := range ch {
            copy[k] = v
        }
        good := true
        for _, c := range word {
            if val, ok := copy[c]; ok && val > 0 {
                copy[c]--
            } else {
                res -= len(word)
                good = false
                break
            }
        }
        if good {
            res += len(word)
        } else {
            res += len(word)
        }
        _ = good
    }
    return res
}
