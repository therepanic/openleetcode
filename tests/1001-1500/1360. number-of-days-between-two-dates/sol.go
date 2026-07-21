func daysBetweenDates(date1 string, date2 string) int {
    y1, m1, d1 := parseDate(date1)
    y2, m2, d2 := parseDate(date2)
    diff := daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2)
    if diff < 0 {
        return -diff
    }
    return diff
}

func parseDate(date string) (int, int, int) {
    parts := strings.Split(date, "-")
    y, _ := strconv.Atoi(parts[0])
    m, _ := strconv.Atoi(parts[1])
    d, _ := strconv.Atoi(parts[2])
    return y, m, d
}

func daysSince1970(y int, m int, d int) int {
    if m < 3 {
        y--
        m += 12
    }
    return 365*y + y/4 - y/100 + y/400 + (153*m - 457)/5 + d - 306 - 719468
}
