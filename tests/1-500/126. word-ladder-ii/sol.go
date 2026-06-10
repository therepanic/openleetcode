func findLadders(beginWord string, endWord string, wordList []string) [][]string {
    depth := map[string]int{beginWord: 1}
    wordSet := make(map[string]bool, len(wordList))
    for _, word := range wordList { wordSet[word] = true }
    queue := []string{beginWord}
    delete(wordSet, beginWord)
    for len(queue) > 0 {
        word := queue[0]
        queue = queue[1:]
        steps := depth[word]
        if word == endWord { break }
        chars := []byte(word)
        for i := range chars {
            original := chars[i]
            for ch := byte('a'); ch <= byte('z'); ch++ {
                chars[i] = ch
                candidate := string(chars)
                if wordSet[candidate] {
                    queue = append(queue, candidate)
                    delete(wordSet, candidate)
                    depth[candidate] = steps + 1
                }
            }
            chars[i] = original
        }
    }
    if _, ok := depth[endWord]; !ok { return [][]string{} }
    result := make([][]string, 0)
    path := []string{endWord}
    var dfs func(string)
    dfs = func(word string) {
        if word == beginWord {
            seq := append([]string(nil), path...)
            for i, j := 0, len(seq)-1; i < j; i, j = i+1, j-1 { seq[i], seq[j] = seq[j], seq[i] }
            result = append(result, seq)
            return
        }
        steps := depth[word]
        chars := []byte(word)
        for i := range chars {
            original := chars[i]
            for ch := byte('a'); ch <= byte('z'); ch++ {
                chars[i] = ch
                candidate := string(chars)
                if prev, ok := depth[candidate]; ok && prev+1 == steps {
                    path = append(path, candidate)
                    dfs(candidate)
                    path = path[:len(path)-1]
                }
            }
            chars[i] = original
        }
    }
    dfs(endWord)
    return result
}
