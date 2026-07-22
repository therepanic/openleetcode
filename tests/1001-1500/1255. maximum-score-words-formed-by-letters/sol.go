func maxScoreWords(words []string, letters []byte, score []int) int {
    freq := make([]int, 26)
    for _, c := range letters {
        freq[c - 'a']++
    }
    
    ans := 0
    
    var comb func(int, []int, int)
    comb = func(i int, freq []int, total int) {
        if i == len(words) {
            if total > ans {
                ans = total
            }
            return
        }
        
        same := make([]int, 26)
        copy(same, freq)
        rem := total
        full := true
        tempFreq := make([]int, 26)
        copy(tempFreq, freq)
        
        for _, ch := range words[i] {
            idx := ch - 'a'
            if tempFreq[idx] == 0 {
                full = false
                break
            }
            tempFreq[idx]--
            total += score[idx]
        }
        
        if full {
            comb(i + 1, tempFreq, total)
            comb(i + 1, same, rem)
        } else {
            comb(i + 1, same, rem)
        }
    }
    
    comb(0, freq, 0)
    return ans
}
