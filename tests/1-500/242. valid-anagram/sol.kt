class Solution {
    fun isAnagram(s: String, t: String): Boolean {
        if (s.length != t.length) {
            return false
        }
        
        val arr = IntArray(26)
        
        for (i in s.indices) {
            arr[s[i] - 'a']++
            arr[t[i] - 'a']--
        }
        
        for (check in arr) {
            if (check != 0) {
                return false
            }
        }
        
        return true
    }
}
