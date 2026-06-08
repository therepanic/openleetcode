class Solution {
    fun minWindow(s: String, t: String): String {
        if (s.length < t.length || t.isEmpty()) return ""

        val need = IntArray(128)
        for (ch in t) need[ch.code]++

        var missing = t.length
        var left = 0
        var bestLeft = 0
        var bestLen = Int.MAX_VALUE

        for (right in s.indices) {
            val ch = s[right]
            if (need[ch.code] > 0) missing--
            need[ch.code]--

            while (missing == 0) {
                val len = right - left + 1
                if (len < bestLen) {
                    bestLen = len
                    bestLeft = left
                }
                val leftChar = s[left++]
                need[leftChar.code]++
                if (need[leftChar.code] > 0) missing++
            }
        }

        return if (bestLen == Int.MAX_VALUE) "" else s.substring(bestLeft, bestLeft + bestLen)
    }
}
