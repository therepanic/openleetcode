class Solution {
    fun dayOfTheWeek(day: Int, month: Int, year: Int): String {
        val days = arrayOf("Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday")
        
        val leapYears = mutableSetOf<Int>()
        for (i in 1960 until 2100 step 4) {
            leapYears.add(i)
        }
        
        val yearsDays = mutableMapOf<Int, Int>()
        for (i in 1960..2100) {
            yearsDays[i] = if (i in leapYears) 366 else 365
        }
        
        val monthsDays = intArrayOf(
            0, 31, if (year in leapYears) 29 else 28, 31, 30, 31, 30,
            31, 31, 30, 31, 30, 31
        )
        
        var resultDays = 0
        for (y in 1971 until year) {
            resultDays += yearsDays[y]!!
        }
        for (m in 1 until month) {
            resultDays += monthsDays[m]
        }
        resultDays += day
        
        return days[resultDays % 7]
    }
}
