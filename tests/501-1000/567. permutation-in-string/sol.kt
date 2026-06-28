class Solution {
    fun checkInclusion(s1: String, s2: String): Boolean {
        val n1 = s1.length
        val n2 = s2.length
        if (n2 < n1) return false

        val c1 = IntArray(26)
        val c2 = IntArray(26)

        for (i in 0 until n1) {
            c1[s1[i] - 'a']++
            c2[s2[i] - 'a']++
        }

        if (c1.contentEquals(c2)) return true

        for (i in n1 until n2) {
            c2[s2[i] - 'a']++
            c2[s2[i - n1] - 'a']--

            if (c1.contentEquals(c2)) return true
        }

        return false
    }
}
