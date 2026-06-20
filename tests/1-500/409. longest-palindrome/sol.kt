class Solution {
    fun longestPalindrome(s: String): Int {
        val count = mutableMapOf<Char, Int>()
        for (c in s) {
            count[c] = count.getOrDefault(c, 0) + 1
        }
        
        var maxLen = 0
        var odd = false
        
        for (freq in count.values) {
            if (freq % 2 == 0) {
                maxLen += freq
            } else {
                maxLen += freq - 1
                odd = true
            }
        }
        
        return maxLen + (if (odd) 1 else 0)
    }
}
