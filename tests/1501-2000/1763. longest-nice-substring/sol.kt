class Solution {
    fun longestNiceSubstring(s: String): String {
        val lenS = s.length
        if (lenS <= 1) return ""

        val charToFreqMap = HashMap<Char, Int>()
        for (c in s) {
            charToFreqMap[c] = charToFreqMap.getOrDefault(c, 0) + 1
        }
        
        var isBroken = false
        var i = 0
        while (i < s.length) {
            val ch = s[i]
            if (ch.isLowerCase() && charToFreqMap.containsKey(ch.uppercaseChar())) {
                // pass
            } else if (ch.isUpperCase() && charToFreqMap.containsKey(ch.lowercaseChar())) {
                // pass
            } else {
                isBroken = true
                break
            }
            i++
        }

        if (!isBroken) return s
        
        val longestNiceSubstr1 = longestNiceSubstring(s.substring(0, i))
        val longestNiceSubstr2 = longestNiceSubstring(s.substring(i + 1))
        
        return if (longestNiceSubstr1.length >= longestNiceSubstr2.length) longestNiceSubstr1 else longestNiceSubstr2
    }
}
