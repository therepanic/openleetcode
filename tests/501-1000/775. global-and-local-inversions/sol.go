func isIdealPermutation(nums []int) bool {
    for i, num := range nums {
        diff := num - i
        if diff < -1 || diff > 1 {
            return false
        }
    }
    return true
}
