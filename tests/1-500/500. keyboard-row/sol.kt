class Solution {
    fun findWords(words: Array<String>): Array<String> {
        val m = IntArray(26)
        for (c in "qwertyuiop") m[c - 'a'] = 1
        for (c in "asdfghjkl") m[c - 'a'] = 2
        for (c in "zxcvbnm") m[c - 'a'] = 3
        val ans = mutableListOf<String>()
        for (w in words) {
            val lw = w.lowercase()
            val r = m[lw[0] - 'a']
            if (lw.all { m[it - 'a'] == r }) {
                ans.add(w)
            }
        }
        return ans.toTypedArray()
    }
}
