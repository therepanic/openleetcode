func dayOfYear(date string) int {
    val := map[int]int{
        1: 0, 2: 31, 3: 59, 4: 90, 5: 120, 6: 151,
        7: 181, 8: 212, 9: 243, 10: 273, 11: 304, 12: 334,
    }
    d, _ := strconv.Atoi(date[8:])
    m, _ := strconv.Atoi(date[5:7])
    y, _ := strconv.Atoi(date[0:4])
    isLeap := (y%400 == 0) || (y%4 == 0 && y%100 != 0)
    if isLeap {
        for i := 3; i <= 12; i++ {
            val[i] += 1
        }
    }
    return d + val[m]
}
