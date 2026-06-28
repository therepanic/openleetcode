func findLHS(nums []int) int {
    frequencyMap := make(map[int]int)
    for _, num := range nums {
        frequencyMap[num]++
    }
    
    maxLength := 0
    for num, count := range frequencyMap {
        if nextCount, exists := frequencyMap[num+1]; exists {
            currentLength := count + nextCount
            if currentLength > maxLength {
                maxLength = currentLength
            }
        }
    }
    
    return maxLength
}
