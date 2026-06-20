func ladderLength(beginWord string, endWord string, wordList []string) int {
    wordSet := make(map[string]bool, len(wordList))
    for _, word := range wordList { wordSet[word] = true }
    if !wordSet[endWord] { return 0 }
    type state struct { word string; steps int }
    queue := []state{{beginWord, 1}}
    for len(queue) > 0 {
        cur := queue[0]
        queue = queue[1:]
        if cur.word == endWord { return cur.steps }
        chars := []byte(cur.word)
        for i := range chars {
            original := chars[i]
            for ch := byte('a'); ch <= byte('z'); ch++ {
                chars[i] = ch
                candidate := string(chars)
                if wordSet[candidate] { delete(wordSet, candidate); queue = append(queue, state{candidate, cur.steps + 1}) }
            }
            chars[i] = original
        }
    }
    return 0
}
