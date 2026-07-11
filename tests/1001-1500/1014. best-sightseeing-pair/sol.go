func maxScoreSightseeingPair(values []int) int {
    n := len(values)
    suffixMax := make([]int, n)
    suffixMax[n-1] = values[n-1] - (n - 1)
    
    for i := n - 2; i >= 0; i-- {
        if suffixMax[i+1] > values[i]-i {
            suffixMax[i] = suffixMax[i+1]
        } else {
            suffixMax[i] = values[i] - i
        }
    }
    
    maxScore := -1 << 31
    for i := 0; i < n-1; i++ {
        score := values[i] + i + suffixMax[i+1]
        if score > maxScore {
            maxScore = score
        }
    }
    
    return maxScore
}
