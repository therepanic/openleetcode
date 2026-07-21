func getLastMoment(n int, left []int, right []int) int {
    maxVal := 0
    for _, value := range left {
        if value > maxVal {
            maxVal = value
        }
    }
    for _, value := range right {
        if n-value > maxVal {
            maxVal = n - value
        }
    }
    return maxVal
}
