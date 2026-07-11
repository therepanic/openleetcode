class Solution {
    fun isAlienSorted(words: Array<String>, order: String): Boolean {
        val orderMap = IntArray(26)
        for (i in order.indices) {
            orderMap[order[i] - 'a'] = i
        }

        for (i in 0 until words.size - 1) {
            val w1 = words[i]
            val w2 = words[i + 1]

            val minLen = minOf(w1.length, w2.length)
            var j = 0
            while (j < minLen) {
                if (w1[j] != w2[j]) {
                    if (orderMap[w1[j] - 'a'] > orderMap[w2[j] - 'a']) {
                        return false
                    }
                    break
                }
                j++
            }
            if (j == minLen && w1.length > w2.length) {
                return false
            }
        }

        return true
    }
}
