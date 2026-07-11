func minEatingSpeed(piles []int, h int) int {
    canFinish := func(k int) bool {
        hours := 0
        for _, pile := range piles {
            hours += pile / k
            if pile % k != 0 {
                hours++
            }
            if hours > h {
                return false
            }
        }
        return true
    }

    left, right := 1, 0
    for _, pile := range piles {
        if pile > right {
            right = pile
        }
    }
    ans := right
    for left <= right {
        mid := left + (right - left) / 2
        if canFinish(mid) {
            ans = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return ans
}
