class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        let unique = Array(Set(words))
        let trie = TrieNode()
        var nodes: [TrieNode] = []
        for word in unique {
            var node = trie
            for ch in word.reversed() {
                if let next = node.children[ch] {
                    node = next
                } else {
                    let newNode = TrieNode()
                    node.children[ch] = newNode
                    node = newNode
                }
            }
            nodes.append(node)
        }
        var ans = 0
        for (i, word) in unique.enumerated() {
            if nodes[i].children.isEmpty {
                ans += word.count + 1
            }
        }
        return ans
    }
}

class TrieNode {
    var children: [Character: TrieNode] = [:]
}
