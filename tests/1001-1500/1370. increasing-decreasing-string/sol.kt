class Solution {
    fun sortString(s: String): String {
        if (s.isEmpty()) return ""
        val counts = IntArray(26)
        for (c in s) {
            counts[c - 'a']++
        }
        val ans = StringBuilder()
        var added: Boolean
        do {
            added = false
            for (i in 0..25) {
                if (counts[i] > 0) {
                    ans.append('a' + i)
                    counts[i]--
                    added = true
                }
            }
            for (i in 25 downTo 0) {
                if (counts[i] > 0) {
                    ans.append('a' + i)
                    counts[i]--
                    added = true
                }
            }
        } while (added)
        return ans.toString()
    }
}
