func eliminateMaximum(dist []int, speed []int) int {
    arrival := make([]int, len(dist))
    for i := 0; i < len(dist); i++ {
        arrival[i] = (dist[i] + speed[i] - 1) / speed[i]
    }
    sort.Ints(arrival)
    for minute, time := range arrival {
        if time <= minute {
            return minute
        }
    }
    return len(arrival)
}
