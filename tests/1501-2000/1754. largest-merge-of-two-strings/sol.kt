class Solution {
    fun largestMerge(word1: String, word2: String): String {
        val res = StringBuilder()
        var i = 0
        var j = 0
        while (i < word1.length && j < word2.length) {
            if (word1[i] > word2[j]) {
                res.append(word1[i])
                i++
            } else if (word1[i] < word2[j]) {
                res.append(word2[j])
                j++
            } else {
                var p = i
                var q = j
                while (p < word1.length && q < word2.length && word1[p] == word2[q]) {
                    p++
                    q++
                }
                if (q == word2.length || (p < word1.length && word1[p] > word2[q])) {
                    res.append(word1[i])
                    i++
                } else {
                    res.append(word2[j])
                    j++
                }
            }
        }
        while (i < word1.length) {
            res.append(word1[i])
            i++
        }
        while (j < word2.length) {
            res.append(word2[j])
            j++
        }
        return res.toString()
    }
}
