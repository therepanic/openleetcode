class Solution {
    fun findLongestWord(s: String, dictionary: List<String>): String {
        var ans = ""
        for (word in dictionary) {
            var i = 0
            var j = 0
            while (i < word.length && j < s.length) {
                if (word[i] == s[j]) {
                    i++
                }
                j++
            }
            if (i == word.length) {
                if (word.length > ans.length) {
                    ans = word
                } else if (word.length == ans.length && word < ans) {
                    ans = word
                }
            }
        }
        return ans
    }
}
