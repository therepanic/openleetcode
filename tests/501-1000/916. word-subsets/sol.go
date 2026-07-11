func wordSubsets(words1 []string, words2 []string) []string {
    maxCharFreq := make([]int, 26)
    tempCharFreq := make([]int, 26)

    for _, word := range words2 {
        for _, ch := range word {
            tempCharFreq[ch - 'a']++
        }
        for i := 0; i < 26; i++ {
            if tempCharFreq[i] > maxCharFreq[i] {
                maxCharFreq[i] = tempCharFreq[i]
            }
        }
        for i := range tempCharFreq {
            tempCharFreq[i] = 0
        }
    }

    universalWords := []string{}

    for _, word := range words1 {
        for _, ch := range word {
            tempCharFreq[ch - 'a']++
        }
        isUniversal := true
        for i := 0; i < 26; i++ {
            if maxCharFreq[i] > tempCharFreq[i] {
                isUniversal = false
                break
            }
        }
        if isUniversal {
            universalWords = append(universalWords, word)
        }
        for i := range tempCharFreq {
            tempCharFreq[i] = 0
        }
    }

    return universalWords
}
