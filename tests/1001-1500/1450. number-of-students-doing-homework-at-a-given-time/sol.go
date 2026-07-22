func busyStudent(startTime []int, endTime []int, queryTime int) int {
    count := 0
    for i := range startTime {
        if startTime[i] <= queryTime && queryTime <= endTime[i] {
            count++
        }
    }
    return count
}
