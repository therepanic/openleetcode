class Solution {
    fun longestDupSubstring(s: String): String {
        val n = s.length
        val base1 = 131L
        val base2 = 31L
        val mod1 = 1000000005L
        val mod2 = 1000000007L

        val h1 = LongArray(n + 1)
        val p1 = LongArray(n + 1) { if (it == 0) 1L else 0L }
        val h2 = LongArray(n + 1)
        val p2 = LongArray(n + 1) { if (it == 0) 1L else 0L }

        for (i in 0 until n) {
            h1[i + 1] = (h1[i] * base1 + s[i].code.toLong()) % mod1
            p1[i + 1] = (p1[i] * base1) % mod1
            h2[i + 1] = (h2[i] * base2 + s[i].code.toLong()) % mod2
            p2[i + 1] = (p2[i] * base2) % mod2
        }

        fun check(L: Int): String {
            val seen = HashSet<Long>()
            for (i in 0..n - L) {
                var v1 = (h1[i + L] - h1[i] * p1[L]) % mod1
                if (v1 < 0) v1 += mod1
                var v2 = (h2[i + L] - h2[i] * p2[L]) % mod2
                if (v2 < 0) v2 += mod2
                val key = v1 * mod2 + v2
                if (!seen.add(key)) return s.substring(i, i + L)
            }
            return ""
        }

        var lo = 1
        var hi = n
        var res = ""
        while (lo <= hi) {
            val mid = (lo + hi) / 2
            val t = check(mid)
            if (t.isNotEmpty()) {
                res = t
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        return res
    }
}
