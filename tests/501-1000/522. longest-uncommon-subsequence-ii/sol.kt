class Solution {
    fun findLUSlength(strs: Array<String>): Int {
        strs.sortByDescending { it.length }

        fun isSubsequence(s: String, t: String): Boolean {
            var i = 0
            for (c in t) {
                if (i < s.length && s[i] == c) i++
            }
            return i == s.length
        }

        for (i in strs.indices) {
            var isUnique = true
            for (j in strs.indices) {
                if (i == j) continue
                if (isSubsequence(strs[i], strs[j])) {
                    isUnique = false
                    break
                }
            }
            if (isUnique) return strs[i].length
        }

        return -1
    }
}
