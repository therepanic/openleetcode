class Solution {
    func longestWord(_ words: [String]) -> String {
        class TrieNode {
            var children: [Character: TrieNode] = [:]
            var end: Int = -1
        }

        let root = TrieNode()
        for (i, word) in words.enumerated() {
            var cur = root
            for ch in word {
                if cur.children[ch] == nil {
                    cur.children[ch] = TrieNode()
                }
                cur = cur.children[ch]!
            }
            cur.end = i
        }

        var stack = Array(root.children.values)
        var ans = ""
        while !stack.isEmpty {
            let cur = stack.removeLast()
            if cur.end != -1 {
                let word = words[cur.end]
                if word.count > ans.count || (word.count == ans.count && word < ans) {
                    ans = word
                }
                for (_, v) in cur.children {
                    stack.append(v)
                }
            }
        }
        return ans
    }
}
