func minimumSize(nums []int, maxOperations int) int {
    lo, hi := 1, 0
    for _, x := range nums {
        if x > hi { hi = x }
    }
    for lo < hi {
        mid := (lo + hi) / 2
        needed := 0
        for _, x := range nums {
            needed += (x - 1) / mid
        }
        if needed <= maxOperations {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo
}
