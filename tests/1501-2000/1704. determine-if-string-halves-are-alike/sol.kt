class Solution {
    fun halvesAreAlike(s: String): Boolean {
        val vowels = "aeiouAEIOU"
        val mid = s.length / 2
        var count = 0
        for (i in 0 until mid) {
            if (vowels.contains(s[i])) count++
        }
        for (i in mid until s.length) {
            if (vowels.contains(s[i])) count--
        }
        return count == 0
    }
}
