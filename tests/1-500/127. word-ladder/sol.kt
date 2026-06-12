class Solution {
    fun ladderLength(beginWord: String, endWord: String, wordList: Array<String>): Int {
        val wordSet = wordList.toMutableSet()
        if (endWord !in wordSet) return 0
        val queue: java.util.ArrayDeque<Pair<String, Int>> = java.util.ArrayDeque()
        queue.add(beginWord to 1)
        while (queue.isNotEmpty()) {
            val (word, steps) = queue.removeFirst()
            if (word == endWord) return steps
            val chars = word.toCharArray()
            for (i in chars.indices) {
                val original = chars[i]
                for (ch in 'a'..'z') {
                    chars[i] = ch
                    val candidate = String(chars)
                    if (wordSet.remove(candidate)) queue.add(candidate to (steps + 1))
                }
                chars[i] = original
            }
        }
        return 0
    }
}
