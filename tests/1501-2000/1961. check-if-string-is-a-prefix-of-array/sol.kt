class Solution {
    fun isPrefixString(s: String, words: Array<String>): Boolean {
        var res = StringBuilder()
        var i = 0
        while (res.length < s.length) {
            if (i >= words.size) return false
            res.append(words[i])
            i++
        }
        return res.toString() == s
    }
}
