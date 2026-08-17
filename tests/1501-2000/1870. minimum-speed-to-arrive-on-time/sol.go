func minSpeedOnTime(dist []int, hour float64) int {
    if len(dist) == 0 {
        return -1
    }
    
    canReach := func(speed int) bool {
        var total float64
        for i := 0; i < len(dist)-1; i++ {
            total += float64((dist[i] + speed - 1) / speed)
        }
        total += float64(dist[len(dist)-1]) / float64(speed)
        return total <= hour
    }
    
    low, high, ans := 1, 10000000, -1
    for low <= high {
        mid := (low + high) / 2
        if canReach(mid) {
            ans = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return ans
}
