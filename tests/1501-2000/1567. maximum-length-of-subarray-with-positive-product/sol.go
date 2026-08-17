func getMaxLen(nums []int) int {
    posLen, negLen, maxLen := 0, 0, 0
    for _, num := range nums {
        if num == 0 {
            posLen = 0
            negLen = 0
        } else if num > 0 {
            posLen++
            if negLen > 0 {
                negLen++
            } else {
                negLen = 0
            }
        } else {
            temp := posLen
            if negLen > 0 {
                posLen = negLen + 1
            } else {
                posLen = 0
            }
            negLen = temp + 1
        }
        if posLen > maxLen {
            maxLen = posLen
        }
    }
    return maxLen
}
