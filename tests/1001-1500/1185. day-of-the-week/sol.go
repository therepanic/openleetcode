func dayOfTheWeek(day int, month int, year int) string {
    days := []string{"Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"}
    
    leapYears := make(map[int]bool)
    for i := 1960; i < 2100; i += 4 {
        leapYears[i] = true
    }
    
    yearsDays := make(map[int]int)
    for i := 1960; i <= 2100; i++ {
        if leapYears[i] {
            yearsDays[i] = 366
        } else {
            yearsDays[i] = 365
        }
    }
    
    monthsDays := []int{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    if leapYears[year] {
        monthsDays[2] = 29
    }
    
    resultDays := 0
    for y := 1971; y < year; y++ {
        resultDays += yearsDays[y]
    }
    for m := 1; m < month; m++ {
        resultDays += monthsDays[m]
    }
    resultDays += day
    
    return days[resultDays % 7]
}
