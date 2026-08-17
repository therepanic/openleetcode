func minMoves(nums []int, k int) int {
    idx := []int{}
    for i, v := range nums {
        if v == 1 {
            idx = append(idx, i)
        }
    }
    n := len(idx)
    a := make([]int64, n)
    for i, v := range idx {
        a[i] = int64(v - i)
    }
    prefix := make([]int64, n)
    if n > 0 {
        prefix[0] = a[0]
        for i := 1; i < n; i++ {
            prefix[i] = prefix[i-1] + a[i]
        }
    }
    ans := int64(1<<63 - 1)
    l := 0
    for r := 0; r < n; r++ {
        for r-l+1 > k {
            l++
        }
        if r-l+1 == k {
            mid := (l + r) / 2
            med := a[mid]
            leftSum := prefix[mid]
            if l > 0 {
                leftSum -= prefix[l-1]
            }
            rightSum := prefix[r] - prefix[mid]
            cost := (med*int64(mid-l+1) - leftSum) + (rightSum - med*int64(r-mid))
            if cost < ans {
                ans = cost
            }
        }
    }
    return int(ans)
}
