class Solution {
    fun reformatDate(date: String): String {
        val monthDict = mapOf(
            "Jan" to "01", "Feb" to "02", "Mar" to "03", "Apr" to "04",
            "May" to "05", "Jun" to "06", "Jul" to "07", "Aug" to "08",
            "Sep" to "09", "Oct" to "10", "Nov" to "11", "Dec" to "12"
        )
        val parts = date.split(" ")
        var day = parts[0].dropLast(2)
        if (day.length == 1) day = "0$day"
        val month = monthDict[parts[1]]!!
        val year = parts[2]
        return "$year-$month-$day"
    }
}
