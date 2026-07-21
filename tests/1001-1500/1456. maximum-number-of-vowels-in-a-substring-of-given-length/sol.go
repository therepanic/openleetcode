func isVowel(c byte) bool {
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
}

func maxVowels(s string, k int) int {
    maxVowel := 0
    left := 0
    vowel := 0
    
    for right := 0; right < len(s); right++ {
        if isVowel(s[right]) {
            vowel++
        }
        
        if (right - left + 1) == k {
            if vowel > maxVowel {
                maxVowel = vowel
            }
            if isVowel(s[left]) {
                vowel--
            }
            left++
        }
    }
    
    return maxVowel
}
