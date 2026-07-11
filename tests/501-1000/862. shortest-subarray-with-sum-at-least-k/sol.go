func shortestSubarray(nums []int, k int) int {
    n := len(nums)
    prefix := make([]int64, n+1)
    for i := 0; i < n; i++ {
        prefix[i+1] = prefix[i] + int64(nums[i])
    }
    
    best := n + 1
    dq := make([]int, 0)
    for i, cur := range prefix {
        for len(dq) > 0 && cur - prefix[dq[0]] >= int64(k) {
            if i - dq[0] < best {
                best = i - dq[0]
            }
            dq = dq[1:]
        }
        for len(dq) > 0 && prefix[dq[len(dq)-1]] >= cur {
            dq = dq[:len(dq)-1]
        }
        dq = append(dq, i)
    }
    
    if best == n + 1 {
        return -1
    }
    return best
}
