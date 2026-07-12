func numSubarraysWithSum(nums []int, goal int) int {
    n := len(nums)
    posOf1s := []int{-1}
    total := 0
    count := 0
    
    if goal == 0 {
        for _, num := range nums {
            if num == 0 {
                count++
                total += count
            } else {
                count = 0
            }
        }
        return total
    }
    
    for i, num := range nums {
        if num == 1 {
            posOf1s = append(posOf1s, i)
        }
    }
    posOf1s = append(posOf1s, n)
    
    for i := 1; i < len(posOf1s)-goal; i++ {
        leftChoices := posOf1s[i] - posOf1s[i-1]
        rightChoices := posOf1s[i+goal] - posOf1s[i+goal-1]
        total += leftChoices * rightChoices
    }
    
    return total
}
