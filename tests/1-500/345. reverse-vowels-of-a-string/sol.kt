class Solution {
    fun reverseVowels(s: String): String {
        val vowels = "aeiouAEIOU"
        val chars = s.toCharArray()
        var i = 0
        var j = chars.size - 1
        while (i < j) {
            while (i < j && chars[i] !in vowels) {
                i++
            }
            while (i < j && chars[j] !in vowels) {
                j--
            }
            val temp = chars[i]
            chars[i] = chars[j]
            chars[j] = temp
            i++
            j--
        }
        return String(chars)
    }
}
