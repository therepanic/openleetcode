class Solution {
    fun convertToBase7(num: Int): String {
        if (num == 0) {
            return "0"
        }
        val sign = if (num < 0) "-" else ""
        var n = Math.abs(num)
        val result = StringBuilder()
        while (n > 0) {
            result.insert(0, n % 7)
            n /= 7
        }
        return sign + result.toString()
    }
}
