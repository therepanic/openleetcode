class Solution {
    fun daysBetweenDates(date1: String, date2: String): Int {
        val (y1, m1, d1) = date1.split("-").map { it.toInt() }
        val (y2, m2, d2) = date2.split("-").map { it.toInt() }
        return Math.abs(daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2))
    }

    private fun daysSince1970(y: Int, m: Int, d: Int): Int {
        var year = y
        var month = m
        if (month < 3) {
            year--
            month += 12
        }
        return 365 * year + year / 4 - year / 100 + year / 400 + (153 * month - 457) / 5 + d - 306 - 719468
    }
}
