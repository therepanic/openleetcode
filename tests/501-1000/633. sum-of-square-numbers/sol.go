func judgeSquareSum(c int) bool {
    left := 0
    right := int(math.Sqrt(float64(c)))
    for left <= right {
        currentSum := left*left + right*right
        if currentSum == c {
            return true
        } else if currentSum < c {
            left++
        } else {
            right--
        }
    }
    return false
}
