class Solution {
    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        let days = ["Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"]
        
        var leapYears = Set<Int>()
        for i in stride(from: 1960, to: 2100, by: 4) {
            leapYears.insert(i)
        }
        
        var yearsDays = [Int: Int]()
        for i in 1960...2100 {
            yearsDays[i] = leapYears.contains(i) ? 366 : 365
        }
        
        var monthsDays = [0, 31, leapYears.contains(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
        var resultDays = 0
        for y in 1971..<year {
            resultDays += yearsDays[y]!
        }
        for m in 1..<month {
            resultDays += monthsDays[m]
        }
        resultDays += day
        
        return days[resultDays % 7]
    }
}
