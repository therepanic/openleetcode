func longestNiceSubstring(s string) string {
    lenS := len(s)
    if lenS <= 1 {
        return ""
    }

    charToFreqMap := make(map[byte]int)
    for i := 0; i < len(s); i++ {
        charToFreqMap[s[i]]++
    }
    
    isBroken := false
    i := 0
    for i < len(s) {
        ch := s[i]
        if (ch >= 'a' && ch <= 'z' && charToFreqMap[ch-32] > 0) {
            // pass
        } else if (ch >= 'A' && ch <= 'Z' && charToFreqMap[ch+32] > 0) {
            // pass
        } else {
            isBroken = true
            break
        }
        i++
    }

    if !isBroken {
        return s
    }
    
    longestNiceSubstr1 := longestNiceSubstring(s[:i])
    if i+1 < len(s) {
        longestNiceSubstr2 := longestNiceSubstring(s[i+1:])
        if len(longestNiceSubstr1) >= len(longestNiceSubstr2) {
            return longestNiceSubstr1
        }
        return longestNiceSubstr2
    }
    return longestNiceSubstr1
}
