func shipWithinDays(weights []int, days int) int {
    low := 0
    high := 0
    for _, w := range weights {
        if w > low {
            low = w
        }
        high += w
    }

    for low <= high {
        mid := (low + high) / 2

        requiredDays := 1
        load := 0

        for _, weight := range weights {
            if load + weight > mid {
                requiredDays++
                load = weight
            } else {
                load += weight
            }
        }

        if requiredDays <= days {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return low
}
