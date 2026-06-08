func canJump(nums []int) bool {
    farthest := 0
    for i, n := range nums {
        if i > farthest {
            return false
        }
        if i+n > farthest {
            farthest = i + n
        }
        if farthest >= len(nums)-1 {
            return true
        }
    }
    return true
}
