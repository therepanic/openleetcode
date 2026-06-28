class Solution {
    fun monotoneIncreasingDigits(n: Int): Int {
        val s = n.toString().toCharArray()
        var mark = s.size
        for (i in s.size - 1 downTo 1) {
            if (s[i] < s[i - 1]) {
                s[i - 1]--
                mark = i
            }
        }
        for (i in mark until s.size) {
            s[i] = '9'
        }
        return String(s).toInt()
    }
}
