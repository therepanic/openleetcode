class Solution {
    fun findSubstring(s: String, words: Array<String>): List<Int> {
        val ans = mutableListOf<Int>()
        if (s.isEmpty() || words.isEmpty()) return ans

        val wordLen = words[0].length
        val wordCount = words.size
        val target = HashMap<String, Int>()
        for (word in words) {
            target[word] = target.getOrDefault(word, 0) + 1
        }

        for (offset in 0 until wordLen) {
            var left = offset
            var right = offset
            var used = 0
            val window = HashMap<String, Int>()

            while (right + wordLen <= s.length) {
                val word = s.substring(right, right + wordLen)
                right += wordLen

                if (target.containsKey(word)) {
                    window[word] = window.getOrDefault(word, 0) + 1
                    used++
                    while (window[word]!! > target[word]!!) {
                        val leftWord = s.substring(left, left + wordLen)
                        window[leftWord] = window[leftWord]!! - 1
                        left += wordLen
                        used--
                    }
                    if (used == wordCount) {
                        ans.add(left)
                        val leftWord = s.substring(left, left + wordLen)
                        window[leftWord] = window[leftWord]!! - 1
                        left += wordLen
                        used--
                    }
                } else {
                    window.clear()
                    used = 0
                    left = right
                }
            }
        }

        return ans
    }
}
