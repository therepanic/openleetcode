func numberOfWeeks(milestones []int) int64 {
    var total int64 = 0
    var maxVal int64 = 0
    for _, m := range milestones {
        total += int64(m)
        if int64(m) > maxVal {
            maxVal = int64(m)
        }
    }
    if maxVal <= total - maxVal {
        return total
    }
    return 2 * (total - maxVal) + 1
}
