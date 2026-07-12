class Solution {
    fun minimumLengthEncoding(words: Array<String>): Int {
        val unique = words.toSet().toTypedArray()
        val trie = TrieNode()
        val nodes = unique.map { word ->
            var node = trie
            for (ch in word.reversed()) {
                node = node.children.getOrPut(ch) { TrieNode() }
            }
            node
        }
        return unique.zip(nodes).sumOf { (word, node) ->
            if (node.children.isEmpty()) word.length + 1 else 0
        }
    }
    
    class TrieNode {
        val children = mutableMapOf<Char, TrieNode>()
    }
}
