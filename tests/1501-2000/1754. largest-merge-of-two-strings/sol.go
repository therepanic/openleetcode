func largestMerge(word1 string, word2 string) string {
    res := []byte{}
    i, j := 0, 0
    for i < len(word1) && j < len(word2) {
        if word1[i] > word2[j] {
            res = append(res, word1[i])
            i++
        } else if word1[i] < word2[j] {
            res = append(res, word2[j])
            j++
        } else {
            p, q := i, j
            for p < len(word1) && q < len(word2) && word1[p] == word2[q] {
                p++
                q++
            }
            if q == len(word2) || (p < len(word1) && word1[p] > word2[q]) {
                res = append(res, word1[i])
                i++
            } else {
                res = append(res, word2[j])
                j++
            }
        }
    }
    for i < len(word1) {
        res = append(res, word1[i])
        i++
    }
    for j < len(word2) {
        res = append(res, word2[j])
        j++
    }
    return string(res)
}
