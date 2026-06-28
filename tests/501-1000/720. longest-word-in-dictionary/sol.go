func longestWord(words []string) string {
    type TrieNode struct {
        children map[rune]*TrieNode
        end       int
    }

    root := &TrieNode{children: make(map[rune]*TrieNode), end: -1}
    for i, word := range words {
        cur := root
        for _, ch := range word {
            if _, ok := cur.children[ch]; !ok {
                cur.children[ch] = &TrieNode{children: make(map[rune]*TrieNode), end: -1}
            }
            cur = cur.children[ch]
        }
        cur.end = i
    }

    stack := []*TrieNode{}
    for _, v := range root.children {
        stack = append(stack, v)
    }
    ans := ""
    for len(stack) > 0 {
        cur := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        if cur.end != -1 {
            word := words[cur.end]
            if len(word) > len(ans) || (len(word) == len(ans) && word < ans) {
                ans = word
            }
            for _, v := range cur.children {
                stack = append(stack, v)
            }
        }
    }
    return ans
}
