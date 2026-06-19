class Solution {
    fun characterReplacement(s: String, k: Int): Int {
        var maxCount = 0
        var left = 0
        val freq = IntArray(26)
        
        for (right in s.indices) {
            freq[s[right] - 'A']++
            maxCount = maxOf(maxCount, freq[s[right] - 'A'])
            
            if (right - left + 1 - maxCount > k) {
                freq[s[left] - 'A']--
                left++
            }
        }
        
        return s.length - left
    }
}
