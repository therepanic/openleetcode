class Solution {
    fun makeEqual(words: Array<String>): Boolean {
        val freq = IntArray(26)
        val n = words.size
        for (word in words) {
            for (ch in word) {
                freq[ch - 'a']++
            }
        }
        for (count in freq) {
            if (count % n != 0) {
                return false
            }
        }
        return true
    }
}
