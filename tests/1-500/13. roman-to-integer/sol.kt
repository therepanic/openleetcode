class Solution {
    fun romanToInt(s: String): Int {
        val roman = mapOf(
            'I' to 1,
            'V' to 5,
            'X' to 10,
            'L' to 50,
            'C' to 100,
            'D' to 500,
            'M' to 1000
        )
        var res = 0
        for (i in 0 until s.length - 1) {
            if (roman[s[i]]!! < roman[s[i + 1]]!!) {
                res -= roman[s[i]]!!
            } else {
                res += roman[s[i]]!!
            }
        }
        return res + roman[s.last()]!!
    }
}
