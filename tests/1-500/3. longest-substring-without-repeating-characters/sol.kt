class Solution {
    fun lengthOfLongestSubstring(s: String): Int {
        val lastSeen = mutableMapOf<Char, Int>()
        var start = 0
        var res = 0

        for (end in s.indices) {
            val c = s[end]
            val prev = lastSeen[c]
            if (prev != null && prev >= start) {
                start = prev + 1
            }
            res = maxOf(res, end - start + 1)
            lastSeen[c] = end
        }

        return res
    }
}
