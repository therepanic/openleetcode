class Solution {
    fun dayOfYear(date: String): Int {
        val valMap = mutableMapOf(
            1 to 0, 2 to 31, 3 to 59, 4 to 90, 5 to 120, 6 to 151,
            7 to 181, 8 to 212, 9 to 243, 10 to 273, 11 to 304, 12 to 334
        )
        val d = date.substring(8).toInt()
        val m = date.substring(5, 7).toInt()
        val y = date.substring(0, 4).toInt()
        val isLeap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0)
        if (isLeap) {
            for (i in 3..12) {
                valMap[i] = valMap[i]!! + 1
            }
        }
        return d + valMap[m]!!
    }
}
