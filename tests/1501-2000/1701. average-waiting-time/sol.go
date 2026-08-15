func averageWaitingTime(customers [][]int) float64 {
    waiting := 0
    current := 0
    for _, c := range customers {
        arrival, time := c[0], c[1]
        if current <= arrival {
            current = arrival + time
            waiting += time
        } else {
            current += time
            waiting += (current - arrival)
        }
    }
    return float64(waiting) / float64(len(customers))
}
