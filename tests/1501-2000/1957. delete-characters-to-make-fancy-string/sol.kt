class Solution {
    fun makeFancyString(s: String): String {
        if (s.isEmpty()) return ""
        val result = StringBuilder()
        result.append(s[0])
        var last = s[0]
        var count = 1

        for (i in 1 until s.length) {
            if (s[i] != last) {
                last = s[i]
                count = 0
            }

            count++
            if (count > 2) continue

            result.append(s[i])
        }

        return result.toString()
    }
}
