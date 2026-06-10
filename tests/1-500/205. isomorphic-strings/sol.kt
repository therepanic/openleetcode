class Solution {
    fun isIsomorphic(s: String, t: String): Boolean {
        val st = IntArray(256) { -1 }
        val ts = IntArray(256) { -1 }
        for (i in s.indices) {
            val a = s[i].code
            val b = t[i].code
            if (st[a] != ts[b]) return false
            st[a] = i
            ts[b] = i
        }
        return true
    }
}
