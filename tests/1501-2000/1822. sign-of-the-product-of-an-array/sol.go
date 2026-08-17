func arraySign(nums []int) int {
    for _, num := range nums {
        if num == 0 {
            return 0
        }
    }
    negatives := 0
    for _, num := range nums { if num < 0 { negatives++ } }
    if negatives%2 == 0 {
        return 1
    }
    return -1
}
