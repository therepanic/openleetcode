class Solution {
    fun areAlmostEqual(s1: String, s2: String): Boolean {
        var i = -1
        var j = -1
        var cnt = 0
        for (k in s1.indices) {
            if (s1[k] != s2[k]) {
                cnt++
                if (i == -1) i = k
                else if (j == -1) j = k
            }
        }
        
        if (cnt == 0) return true
        if (cnt == 2 && s1[i] == s2[j] && s1[j] == s2[i]) return true
        return false
    }
}
