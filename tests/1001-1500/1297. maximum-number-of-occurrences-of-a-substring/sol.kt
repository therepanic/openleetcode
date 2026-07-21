class Solution {
    fun maxFreq(s: String, maxLetters: Int, minSize: Int, maxSize: Int): Int {
        val count = mutableMapOf<String, Int>()
        val unique = mutableMapOf<Char, Int>()
        var left = 0
        var res = 0
        for (right in s.indices) {
            val rc = s[right]
            unique[rc] = unique.getOrDefault(rc, 0) + 1

            while (unique.size > maxLetters || right - left + 1 > minSize) {
                val lc = s[left]
                unique[lc] = unique[lc]!! - 1
                if (unique[lc] == 0) {
                    unique.remove(lc)
                }
                left++
            }

            if (right - left + 1 == minSize && unique.size <= maxLetters) {
                val curr = s.substring(left, right + 1)
                val value = count.getOrDefault(curr, 0) + 1
                count[curr] = value
                res = maxOf(res, value)
            }
        }
        return res
    }
}
