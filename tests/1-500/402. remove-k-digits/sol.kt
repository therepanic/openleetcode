class Solution {
    fun removeKdigits(num: String, k: Int): String {
        val s = StringBuilder()
        var remaining = k
        for (c in num) {
            while (remaining > 0 && s.isNotEmpty() && s.last() > c) {
                s.deleteCharAt(s.length - 1)
                remaining--
            }
            s.append(c)
        }
        
        s.setLength(s.length - remaining)
        val result = s.toString().trimStart('0')
        return result.ifEmpty { "0" }
    }
}
