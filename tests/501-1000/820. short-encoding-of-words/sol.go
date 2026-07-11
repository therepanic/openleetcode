func minimumLengthEncoding(words []string) int {
    seen := make(map[string]bool)
    for _, w := range words {
        seen[w] = true
    }
    unique := make([]string, 0, len(seen))
    for w := range seen {
        unique = append(unique, w)
    }
    
    trie := &TrieNode{children: make(map[byte]*TrieNode)}
    nodes := make([]*TrieNode, len(unique))
    for i, word := range unique {
        node := trie
        for j := len(word) - 1; j >= 0; j-- {
            ch := word[j]
            if _, ok := node.children[ch]; !ok {
                node.children[ch] = &TrieNode{children: make(map[byte]*TrieNode)}
            }
            node = node.children[ch]
        }
        nodes[i] = node
    }
    
    ans := 0
    for i, word := range unique {
        if len(nodes[i].children) == 0 {
            ans += len(word) + 1
        }
    }
    return ans
}

type TrieNode struct {
    children map[byte]*TrieNode
}
