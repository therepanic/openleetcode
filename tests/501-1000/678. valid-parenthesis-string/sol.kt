class Solution {
    fun checkValidString(s: String): Boolean {
        var low = 0
        var high = 0
        for (c in s) {
            when (c) {
                '(' -> {
                    low++
                    high++
                }
                ')' -> {
                    low = maxOf(low - 1, 0)
                    high--
                }
                else -> {
                    low = maxOf(low - 1, 0)
                    high++
                }
            }
            if (high < 0) return false
        }
        return low == 0
    }
}
