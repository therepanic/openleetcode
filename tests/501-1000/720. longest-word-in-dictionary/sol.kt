class Solution {
    fun longestWord(words: Array<String>): String {
        val root = TrieNode()
        for ((i, word) in words.withIndex()) {
            var cur = root
            for (ch in word) {
                cur = cur.children.getOrPut(ch) { TrieNode() }
            }
            cur.end = i
        }

        val stack = ArrayDeque<TrieNode>()
        stack.addAll(root.children.values)
        var ans = ""
        while (stack.isNotEmpty()) {
            val cur = stack.removeLast()
            if (cur.end != -1) {
                val word = words[cur.end]
                if (word.length > ans.length || (word.length == ans.length && word < ans)) {
                    ans = word
                }
                for ((_, value) in cur.children) {
                    stack.addLast(value)
                }
            }
        }
        return ans
    }

    class TrieNode {
        val children = mutableMapOf<Char, TrieNode>()
        var end = -1
    }
}
