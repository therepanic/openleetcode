class Solution {
    fun partitionLabels(s: String): List<Int> {
        val ans = mutableListOf<Int>()
        if (s.length == 1) {
            ans.add(1)
            return ans
        }
        val seen = mutableMapOf<Char, MutableList<Int>>()
        for (i in s.indices) {
            val ch = s[i]
            if (ch !in seen) {
                seen[ch] = mutableListOf(i, i)
            } else {
                seen[ch]!![1] = i
            }
        }
        val arrSeen = seen.values.toList()
        val merged = mutableListOf(arrSeen[0])
        for (i in 1 until arrSeen.size) {
            val last = merged.last()
            val cur = arrSeen[i]
            if (last[1] >= cur[0]) {
                last[1] = maxOf(last[1], cur[1])
            } else {
                merged.add(cur)
            }
        }
        for ((start, end) in merged) {
            ans.add(end - start + 1)
        }
        return ans
    }
}
