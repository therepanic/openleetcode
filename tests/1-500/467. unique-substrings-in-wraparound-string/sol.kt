class Solution {
    fun findSubstringInWraproundString(s: String): Int {
        val counts = IntArray(26)
        var maxLen = 0

        for (i in s.indices) {
            if (i > 0 && (s[i] - s[i - 1] + 26) % 26 == 1) {
                maxLen++
            } else {
                maxLen = 1
            }
            val idx = s[i] - 'a'
            counts[idx] = maxOf(counts[idx], maxLen)
        }

        return counts.sum()
    }
}
