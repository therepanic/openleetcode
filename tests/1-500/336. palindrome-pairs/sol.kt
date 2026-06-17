class Solution {
    private fun isPalindrome(s: String): Boolean {
        return s == s.reversed()
    }

    fun palindromePairs(words: Array<String>): List<List<Int>> {
        val ans = mutableListOf<List<Int>>()
        val wordMap = mutableMapOf<String, Int>()
        for ((i, word) in words.withIndex()) {
            wordMap[word.reversed()] = i
        }

        if (wordMap.containsKey("")) {
            val emptyIdx = wordMap[""]!!
            for ((i, word) in words.withIndex()) {
                if (word != "" && isPalindrome(word)) {
                    ans.add(listOf(i, emptyIdx))
                }
            }
        }

        for ((i, word) in words.withIndex()) {
            for (j in 0 until word.length) {
                val left = word.substring(0, j + 1)
                val right = word.substring(j + 1)
                if (wordMap.containsKey(left) && isPalindrome(right) && wordMap[left] != i) {
                    ans.add(listOf(i, wordMap[left]!!))
                }
                if (wordMap.containsKey(right) && isPalindrome(left) && wordMap[right] != i) {
                    ans.add(listOf(wordMap[right]!!, i))
                }
            }
        }
        return ans
    }
}
