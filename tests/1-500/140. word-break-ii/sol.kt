class Solution {
    fun wordBreak(s: String, wordDict: Array<String>): List<String> {
        val words = ArrayList<String>(wordDict.size)
        for (word in wordDict) {
            words.add(word)
        }

        val canBreak = BooleanArray(s.length + 1)
        canBreak[s.length] = true
        var start = s.length - 1
        while (start >= 0) {
            for (word in words) {
                val end = start + word.length
                if (end <= s.length && canBreak[end] && s.startsWith(word, start)) {
                    canBreak[start] = true
                    break
                }
            }
            start--
        }
        if (!canBreak[0]) {
            return emptyList()
        }

        val memo = HashMap<Int, List<String>>()
        fun dfs(index: Int): List<String> {
            memo[index]?.let { return it }
            val result = mutableListOf<String>()
            for (word in words) {
                val end = index + word.length
                if (end > s.length || !canBreak[end] || !s.startsWith(word, index)) {
                    continue
                }
                if (end == s.length) {
                    result.add(word)
                } else {
                    for (tail in dfs(end)) {
                        result.add("$word $tail")
                    }
                }
            }
            memo[index] = result
            return result
        }

        return dfs(0)
    }
}
