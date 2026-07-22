func maxScore(s string) int {
    totalOnes := 0
    for _, c := range s {
        if c == '1' {
            totalOnes++
        }
    }
    
    zerosCount := 0
    onesCount := 0
    bestScore := -1 << 31 // minimum int
    
    for i := 0; i < len(s)-1; i++ {
        if s[i] == '0' {
            zerosCount++
        } else {
            onesCount++
        }
        
        currentScore := zerosCount + (totalOnes - onesCount)
        if currentScore > bestScore {
            bestScore = currentScore
        }
    }
    
    return bestScore
}
