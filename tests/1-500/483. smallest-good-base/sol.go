func smallestGoodBase(n string) string {
    num, _ := strconv.ParseUint(n, 10, 64)
    maxM := int(math.Log2(float64(num)))
    for m := maxM; m >= 1; m-- {
        left := uint64(2)
        right := uint64(math.Pow(float64(num), 1.0/float64(m))) + 1
        for left <= right {
            mid := left + (right-left)/2
            cmp := compareBase(mid, m, num)
            if cmp == 0 {
                return strconv.FormatUint(mid, 10)
            }
            if cmp < 0 {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return strconv.FormatUint(num-1, 10)
}

func compareBase(base uint64, m int, n uint64) int {
    var sum uint64 = 1
    var cur uint64 = 1
    for i := 0; i < m; i++ {
        if cur > (n-sum)/base {
            return 1
        }
        cur *= base
        sum += cur
        if sum > n {
            return 1
        }
    }
    if sum == n {
        return 0
    }
    return -1
}
