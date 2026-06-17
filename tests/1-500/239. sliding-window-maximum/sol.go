func maxSlidingWindow(nums []int, k int) []int {
    res := []int{}
    q := []int{}
    for idx, num := range nums {
        for len(q) > 0 && q[len(q)-1] < num {
            q = q[:len(q)-1]
        }
        q = append(q, num)
        if idx >= k && nums[idx-k] == q[0] {
            q = q[1:]
        }
        if idx >= k-1 {
            res = append(res, q[0])
        }
    }
    return res
}
