class Solution {
    fun reverseOnlyLetters(s: String): String {
        val chars = s.toCharArray()
        var start = 0
        var end = chars.size - 1
        while (true) {
            if (start >= end) {
                break
            }
            
            if (chars[start].isLetter() && chars[end].isLetter()) {
                val temp = chars[start]
                chars[start] = chars[end]
                chars[end] = temp
                start++
                end--
            } else if (!chars[start].isLetter()) {
                start++
            } else {
                end--
            }
        }
        
        return String(chars)
    }
}
