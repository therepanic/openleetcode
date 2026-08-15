class Solution {
    fun longestBeautifulSubstring(word: String): Int {
        val n = word.length
        var i = 0
        var length = 0

        while (i < n) {
            if (word[i] != 'a') {
                i++
                continue
            }

            var j = i
            var unique = 1
            while (j + 1 < n && word[j + 1] >= word[j]) {
                if (word[j + 1] != word[j]) {
                    unique++
                }
                j++
            }

            if (unique == 5) {
                length = maxOf(length, j - i + 1)
            }

            i = j + 1
        }

        return length
    }
}
