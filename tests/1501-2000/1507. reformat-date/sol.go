func reformatDate(date string) string {
    monthDict := map[string]string{
        "Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04",
        "May": "05", "Jun": "06", "Jul": "07", "Aug": "08",
        "Sep": "09", "Oct": "10", "Nov": "11", "Dec": "12",
    }
    parts := strings.Split(date, " ")
    day := parts[0][:len(parts[0])-2]
    if len(day) == 1 {
        day = "0" + day
    }
    month := monthDict[parts[1]]
    year := parts[2]
    return year + "-" + month + "-" + day
}
