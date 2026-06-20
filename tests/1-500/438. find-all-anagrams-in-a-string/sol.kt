class Solution {
    fun findAnagrams(s: String, p: String): List<Int> {
        val n1 = s.length
        val n2 = p.length
        val res = mutableListOf<Int>()
        if (n1 < n2) return res

        val a = IntArray(26)
        val b = IntArray(26)

        for (i in 0 until n2) {
            a[p[i] - 'a']++
            b[s[i] - 'a']++
        }

        if (a.contentEquals(b)) res.add(0)

        for (i in n2 until n1) {
            b[s[i] - 'a']++
            b[s[i - n2] - 'a']--
            if (a.contentEquals(b)) res.add(i - n2 + 1)
        }

        return res
    }
}
