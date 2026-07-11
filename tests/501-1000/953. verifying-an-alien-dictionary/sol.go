func isAlienSorted(words []string, order string) bool {
    orderMap := make(map[byte]int)
    for i := 0; i < len(order); i++ {
        orderMap[order[i]] = i
    }

    for i := 0; i < len(words)-1; i++ {
        w1 := words[i]
        w2 := words[i+1]

        minLen := len(w1)
        if len(w2) < minLen {
            minLen = len(w2)
        }

        j := 0
        for j < minLen {
            if w1[j] != w2[j] {
                if orderMap[w1[j]] > orderMap[w2[j]] {
                    return false
                }
                break
            }
            j++
        }

        if j == minLen && len(w1) > len(w2) {
            return false
        }
    }

    return true
}
