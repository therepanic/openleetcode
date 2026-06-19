class Solution {
    fun licenseKeyFormatting(s: String, k: Int): String {
        val str = s.replace("-", "").uppercase()
        val result = mutableListOf<String>()
        var i = str.length
        while (i > 0) {
            val start = maxOf(0, i - k)
            result.add(str.substring(start, i))
            i -= k
        }
        return result.reversed().joinToString("-")
    }
}
