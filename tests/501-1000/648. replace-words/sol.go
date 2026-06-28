func replaceWords(dictionary []string, sentence string) string {
    trie := map[string]interface{}{"*": false}
    arr := strings.Split(sentence, " ")
    
    addInTrie := func(trie map[string]interface{}, word string) {
        n := trie
        for _, letter := range word {
            key := string(letter)
            if _, ok := n[key]; !ok {
                n[key] = map[string]interface{}{"*": false}
            }
            n = n[key].(map[string]interface{})
        }
        n["*"] = true
    }
    
    getReplacement := func(trie map[string]interface{}, word string) string {
        n := trie
        for i := 0; i < len(word); i++ {
            if n["*"].(bool) {
                return word[0:i]
            }
            key := string(word[i])
            if _, ok := n[key]; !ok {
                break
            }
            n = n[key].(map[string]interface{})
        }
        return word
    }
    
    for _, word := range dictionary {
        addInTrie(trie, word)
    }
    
    for i, word := range arr {
        arr[i] = getReplacement(trie, word)
    }
    
    return strings.Join(arr, " ")
}
