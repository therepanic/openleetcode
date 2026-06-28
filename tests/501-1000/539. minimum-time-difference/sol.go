func findMinDifference(timePoints []string) int {
    times := make([]int, len(timePoints))
    for i, t := range timePoints {
        parts := strings.Split(t, ":")
        h, _ := strconv.Atoi(parts[0])
        m, _ := strconv.Atoi(parts[1])
        times[i] = h*60 + m
    }
    sort.Ints(times)
    minDiff := math.MaxInt32
    for i := 1; i < len(times); i++ {
        if times[i] - times[i-1] < minDiff {
            minDiff = times[i] - times[i-1]
        }
    }
    if 1440 + times[0] - times[len(times)-1] < minDiff {
        minDiff = 1440 + times[0] - times[len(times)-1]
    }
    return minDiff
}
