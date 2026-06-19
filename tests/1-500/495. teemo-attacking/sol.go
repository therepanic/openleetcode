func findPoisonedDuration(timeSeries []int, duration int) int {
    totalSecs := 0
    var prev *int = nil

    for _, t := range timeSeries {
        totalSecs += duration

        if prev != nil && *prev + duration > t {
            totalSecs -= (*prev + duration - t)
        }

        val := t
        prev = &val
    }

    return totalSecs
}
