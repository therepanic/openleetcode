func canBeTypedWords(text string, brokenLetters string) int {
    b := make([]bool, 26)
    res := 0

    for _, c := range brokenLetters {
        b[c-'a'] = true
    }

    words := strings.Split(text, " ")
    for _, w := range words {
        ok := true
        for _, c := range w {
            if b[c-'a'] {
                ok = false
                break
            }
        }
        if ok {
            res++
        }
    }

    return res
}
