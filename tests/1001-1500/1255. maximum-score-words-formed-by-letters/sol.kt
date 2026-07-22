class Solution {
    fun maxScoreWords(words: Array<String>, letters: CharArray, score: IntArray): Int {
        val available = IntArray(26)
        for (letter in letters) available[letter - 'a']++

        fun search(index: Int): Int {
            if (index == words.size) return 0
            var best = search(index + 1)
            var value = 0
            var usable = true
            for (letter in words[index]) {
                val code = letter - 'a'
                available[code]--
                value += score[code]
                if (available[code] < 0) usable = false
            }
            if (usable) best = maxOf(best, value + search(index + 1))
            for (letter in words[index]) available[letter - 'a']++
            return best
        }

        return search(0)
    }
}
