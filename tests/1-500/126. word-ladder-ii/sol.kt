class Solution {
    fun findLadders(beginWord: String, endWord: String, wordList: Array<String>): List<List<String>> {
        val dict = HashSet<String>(wordList.size)
        for (word in wordList) {
            dict.add(word)
        }
        if (!dict.contains(endWord)) {
            return emptyList()
        }

        val parents = HashMap<String, MutableList<String>>()
        var currentLevel = hashSetOf(beginWord)
        var found = false

        while (currentLevel.isNotEmpty() && !found) {
            for (word in currentLevel) {
                dict.remove(word)
            }

            val nextLevel = HashSet<String>()
            for (word in currentLevel) {
                val chars = word.toCharArray()
                for (i in chars.indices) {
                    val original = chars[i]
                    for (code in 0 until 26) {
                        val ch = ('a'.code + code).toChar()
                        if (ch == original) {
                            continue
                        }
                        chars[i] = ch
                        val candidate = String(chars)
                        if (dict.contains(candidate)) {
                            parents.getOrPut(candidate) { mutableListOf() }.add(word)
                            if (candidate == endWord) {
                                found = true
                            }
                            nextLevel.add(candidate)
                        }
                    }
                    chars[i] = original
                }
            }
            currentLevel = nextLevel
        }

        if (!found) {
            return emptyList()
        }

        val result = mutableListOf<List<String>>()
        val path = mutableListOf(endWord)
        fun dfs(word: String) {
            if (word == beginWord) {
                result.add(path.asReversed().toList())
                return
            }
            val prevWords = parents[word] ?: return
            for (prev in prevWords) {
                path.add(prev)
                dfs(prev)
                path.removeAt(path.lastIndex)
            }
        }

        dfs(endWord)
        return result
    }
}
