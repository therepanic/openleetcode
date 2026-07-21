func suggestedProducts(products []string, searchWord string) [][]string {
    sort.Strings(products)
    type node struct {
        children    map[rune]*node
        suggestions []string
    }
    root := &node{children: make(map[rune]*node)}
    
    // Insert each product into the Trie and store top 3 suggestions
    for _, product := range products {
        curr := root
        for _, ch := range product {
            if _, ok := curr.children[ch]; !ok {
                curr.children[ch] = &node{children: make(map[rune]*node)}
            }
            curr = curr.children[ch]
            if len(curr.suggestions) < 3 {
                curr.suggestions = append(curr.suggestions, product)
            }
        }
    }
    
    // Search each character of searchWord in the Trie
    result := make([][]string, 0)
    curr := root
    for _, ch := range searchWord {
        if curr != nil {
            if next, ok := curr.children[ch]; ok {
                curr = next
                result = append(result, curr.suggestions)
            } else {
                curr = nil
                result = append(result, []string{})
            }
        } else {
            result = append(result, []string{})
        }
    }
    
    return result
}
