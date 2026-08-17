func maxProfit(inventory []int, orders int) int {
    maxVal := 0
    for _, v := range inventory {
        if v > maxVal { maxVal = v }
    }
    t := binarySearch(inventory, 0, maxVal, int64(orders))
    var total, sold int64
    for _, ball := range inventory {
        if int64(ball) > t {
            cnt := int64(ball) - t
            total += (int64(ball) + t + 1) * cnt / 2
            sold += cnt
        }
    }
    extra := sold - int64(orders)
    res := total - extra * (t + 1)
    mod := int64(1000000007)
    return int((res % mod + mod) % mod)
}

func binarySearch(arr []int, left, right int, target int64) int64 {
    for left < right {
        mid := (left + right + 1) / 2
        var count int64
        for _, x := range arr {
            if x > mid {
                count += int64(x - mid)
            }
        }
        if count >= target {
            left = mid
        } else {
            right = mid - 1
        }
    }
    return int64(left)
}
