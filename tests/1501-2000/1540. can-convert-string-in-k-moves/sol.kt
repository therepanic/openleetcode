class Solution {
    fun canConvertString(s: String, t: String, k: Int): Boolean {
        if (s.length != t.length) return false
        val shiftCount = IntArray(26)
        for (i in s.indices) {
            if (s[i] == t[i]) continue
            val diff = (t[i] - s[i] + 26) % 26
            shiftCount[diff]++
            if (diff + 26 * (shiftCount[diff] - 1) > k) return false
        }
        return true
    }
}
