func minimumPerimeter(neededApples int64) int64 {
    lo, hi := int64(0), int64(100000)
    for lo < hi {
        mid := (lo + hi) / 2
        apples := 2 * mid * (mid + 1) * (2*mid + 1)
        if apples >= neededApples {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo * 8
}
