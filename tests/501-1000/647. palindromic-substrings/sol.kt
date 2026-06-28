class Solution {
    fun countSubstrings(s: String): Int {
        var count = 0
        
        fun expand(left: Int, right: Int): Int {
            var l = left
            var r = right
            var res = 0
            while (l >= 0 && r < s.length && s[l] == s[r]) {
                res++
                l--
                r++
            }
            return res
        }
        
        for (i in s.indices) {
            count += expand(i, i)
            count += expand(i, i + 1)
        }
        
        return count
    }
}
