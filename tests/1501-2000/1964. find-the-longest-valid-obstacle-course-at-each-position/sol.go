func longestObstacleCourseAtEachPosition(obstacles []int) []int {
    tails := make([]int, 0, len(obstacles))
    res := make([]int, len(obstacles))
    for i, x := range obstacles {
        idx := upperBound(tails, x)
        res[i] = idx + 1
        if idx == len(tails) {
            tails = append(tails, x)
        } else {
            tails[idx] = x
        }
    }
    return res
}

func upperBound(arr []int, target int) int {
    lo, hi := 0, len(arr)
    for lo < hi {
        mid := lo + (hi-lo)/2
        if arr[mid] <= target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
