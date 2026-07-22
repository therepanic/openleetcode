func findNumOfValidWords(words []string, puzzles []string) []int {
    getMask := func(s string) int {
        mask := 0
        for _, ch := range s {
            mask |= 1 << (ch - 'a')
        }
        return mask
    }
    
    wordCount := make(map[int]int)
    for _, w := range words {
        mask := getMask(w)
        wordCount[mask]++
    }
    
    result := make([]int, len(puzzles))
    for i, p := range puzzles {
        firstMask := 1 << (p[0] - 'a')
        puzzleMask := getMask(p)
        sub := puzzleMask
        count := 0
        for {
            if sub & firstMask != 0 {
                count += wordCount[sub]
            }
            if sub == 0 {
                break
            }
            sub = (sub - 1) & puzzleMask
        }
        result[i] = count
    }
    return result
}
