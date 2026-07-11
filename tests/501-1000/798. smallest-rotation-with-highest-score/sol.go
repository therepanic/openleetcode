func bestRotation(nums []int) int {
    n := len(nums)
    diffs := make([]int, n+1)
    for i, num := range nums {
        left := ((i - num + 1) % n + n) % n
        right := (i + 1) % n
        diffs[left]--
        diffs[right]++
        if left > right {
            diffs[0]--
        }
    }
    best := 0
    cur := n
    maxScore := cur
    for k := 1; k < n; k++ {
        cur += diffs[k]
        if cur > maxScore {
            maxScore = cur
            best = k
        }
    }
    return best
}
