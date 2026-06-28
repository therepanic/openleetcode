func findKthNumber(m int, n int, k int) int {
    lo, hi := 1, m*n
    for lo < hi {
        mid := lo + (hi-lo)/2
        count := 0
        for i := 1; i <= m; i++ {
            if n < mid/i {
                count += n
            } else {
                count += mid / i
            }
        }
        if count >= k {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo
}
