class Solution {
    fun canConstruct(s: String, k: Int): Boolean {
        if (s.length < k) {
            return false
        }

        val charCount = IntArray(26)
        for (c in s) {
            charCount[c - 'a']++
        }

        val oddCount = charCount.count { it % 2 != 0 }
        return oddCount <= k
    }
}
