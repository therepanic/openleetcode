class Solution {
    fun balancedString(s: String): Int {
        val n = s.length
        val each = n / 4
        val count = mutableMapOf<Char, Int>()
        for (c in s) {
            count[c] = count.getOrDefault(c, 0) + 1
        }
        val extra = mutableMapOf<Char, Int>()
        for ((k, v) in count) {
            if (v > each) {
                extra[k] = v - each
            }
        }
        if (extra.isEmpty()) return 0
        var left = 0
        var res = Int.MAX_VALUE
        val curr = mutableMapOf<Char, Int>()
        for (right in 0 until n) {
            val rc = s[right]
            if (rc in extra) {
                curr[rc] = curr.getOrDefault(rc, 0) + 1
            }
            while (extra.all { curr.getOrDefault(it.key, 0) >= it.value } && left <= right) {
                res = minOf(res, right - left + 1)
                val lc = s[left]
                if (lc in curr) {
                    curr[lc] = curr[lc]!! - 1
                    if (curr[lc] == 0) {
                        curr.remove(lc)
                    }
                }
                left++
            }
        }
        return res
    }
}
