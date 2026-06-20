class Solution {
    fun wordBreak(s: String, wordDict: Array<String>): Boolean {
        val words = HashSet<String>(wordDict.size)
        var maxLen = 0
        for (word in wordDict) {
            words.add(word)
            if (word.length > maxLen) {
                maxLen = word.length
            }
        }

        val visited = BooleanArray(s.length + 1)
        val queue: java.util.ArrayDeque<Int> = java.util.ArrayDeque()
        queue.add(0)
        visited[0] = true

        while (queue.isNotEmpty()) {
            val start = queue.removeFirst()
            var end = start + 1
            val limit = minOf(s.length, start + maxLen)
            while (end <= limit) {
                if (words.contains(s.substring(start, end))) {
                    if (end == s.length) {
                        return true
                    }
                    if (!visited[end]) {
                        visited[end] = true
                        queue.add(end)
                    }
                }
                end++
            }
        }

        return false
    }
}
