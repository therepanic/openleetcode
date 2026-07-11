func reverseOnlyLetters(s string) string {
    chars := []rune(s)
    start := 0
    end := len(chars) - 1
    for {
        if start >= end {
            break
        }
        
        startIsLetter := (chars[start] >= 'a' && chars[start] <= 'z') || (chars[start] >= 'A' && chars[start] <= 'Z')
        endIsLetter := (chars[end] >= 'a' && chars[end] <= 'z') || (chars[end] >= 'A' && chars[end] <= 'Z')
        
        if startIsLetter && endIsLetter {
            chars[start], chars[end] = chars[end], chars[start]
            start++
            end--
        } else if !startIsLetter {
            start++
        } else {
            end--
        }
    }
    
    return string(chars)
}
