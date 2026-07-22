class Solution {
    fun distinctEchoSubstrings(text: String): Int {
        val n = text.length
        val b1 = 911382323L
        val b2 = 972663749L
        val m1 = 1000000007L
        val m2 = 1000000009L
        val p1 = LongArray(n + 1) { 1 }
        val p2 = LongArray(n + 1) { 1 }
        val h1 = LongArray(n + 1)
        val h2 = LongArray(n + 1)
        val a = 'a'.code
        for (i in 1..n) {
            val v = (text[i - 1].code - a).toLong()
            p1[i] = (p1[i - 1] * b1) % m1
            p2[i] = (p2[i - 1] * b2) % m2
            h1[i] = (h1[i - 1] * b1 + v) % m1
            h2[i] = (h2[i - 1] * b2 + v) % m2
        }
        fun get(l: Int, r: Int): Pair<Long, Long> {
            val v1 = (h1[r] - h1[l] * p1[r - l]) % m1
            val v2 = (h2[r] - h2[l] * p2[r - l]) % m2
            return Pair(if (v1 < 0) v1 + m1 else v1, if (v2 < 0) v2 + m2 else v2)
        }
        val st = HashSet<Pair<Int, Pair<Long, Long>>>()
        for (i in 0 until n) {
            val maxLen = (n - i) / 2
            for (L in 1..maxLen) {
                if (get(i, i + L) == get(i + L, i + 2 * L)) {
                    st.add(Pair(2 * L, get(i, i + 2 * L)))
                }
            }
        }
        return st.size
    }
}
