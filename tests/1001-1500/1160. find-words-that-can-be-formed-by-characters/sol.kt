class Solution {
    fun countCharacters(words: Array<String>, chars: String): Int {
        val ch = IntArray(26)
        for (c in chars) {
            ch[c - 'a']++
        }
        
        var res = 0
        for (word in words) {
            val copy = ch.clone()
            var good = true
            for (c in word) {
                if (copy[c - 'a'] > 0) {
                    copy[c - 'a']--
                } else {
                    res -= word.length
                    good = false
                    break
                }
            }
            res += word.length
        }
        return res
    }
}
