func distanceBetweenBusStops(distance []int, start int, destination int) int {
    if destination < start {
        start, destination = destination, start
    }
    s := 0
    for i := start; i < destination; i++ {
        s += distance[i]
    }
    total := 0
    for _, d := range distance {
        total += d
    }
    if s < total-s {
        return s
    }
    return total - s
}
