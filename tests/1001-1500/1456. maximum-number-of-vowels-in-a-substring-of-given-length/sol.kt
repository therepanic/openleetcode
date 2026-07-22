class Solution {
    private fun isVowel(c: Char): Boolean {
        return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
    }
    
    fun maxVowels(s: String, k: Int): Int {
        var maxVowel = 0
        var left = 0
        var vowel = 0
        
        for (right in s.indices) {
            if (isVowel(s[right])) {
                vowel++
            }
            
            if ((right - left + 1) == k) {
                maxVowel = maxOf(maxVowel, vowel)
                if (isVowel(s[left])) {
                    vowel--
                }
                left++
            }
        }
        
        return maxVowel
    }
}
