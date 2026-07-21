func kLengthApart(nums []int, k int) bool {
    if k == 0 {
        return true
    }
    prev := -1
    for i, num := range nums {
        if num == 1 {
            if prev != -1 && i-prev <= k {
                return false
            }
            prev = i
        }
    }
    return true
}
