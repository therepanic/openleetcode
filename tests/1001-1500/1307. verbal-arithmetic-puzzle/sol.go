func isSolvable(words []string, result string) bool {
    zeroes := make(map[byte]bool)
    m := 0
    for _, word := range words {
        if len(word) > 1 {
            zeroes[word[0]] = true
        }
        if len(word) > m {
            m = len(word)
        }
    }
    if m > len(result) {
        return false
    }
    d := make(map[byte]int)
    for _, word := range words {
        for i := 0; i < len(word); i++ {
            d[word[i]] = -1
        }
    }
    for i := 0; i < len(result); i++ {
        d[result[i]] = -1
    }
    wordsRev := make([]string, len(words))
    for i, word := range words {
        wordsRev[i] = reverse(word)
    }
    resultRev := reverse(result)
    R := len(resultRev)
    N := len(wordsRev)
    visited := make(map[int]bool)
    for i := 0; i < 10; i++ {
        visited[i] = true
    }

    var rec func(wi, ri, rem int) bool
    rec = func(wi, ri, rem int) bool {
        if ri == R {
            return rem == 0 && (len(resultRev) == 1 || d[resultRev[R-1]] != 0)
        }
        if wi == N {
            if d[resultRev[ri]] != -1 {
                if d[resultRev[ri]] != rem%10 {
                    return false
                } else {
                    return rec(0, ri+1, rem/10)
                }
            } else if visited[rem%10] {
                val := rem % 10
                delete(visited, val)
                d[resultRev[ri]] = val
                ret := rec(wi, ri, rem)
                d[resultRev[ri]] = -1
                visited[val] = true
                if ret {
                    return true
                }
            }
            return false
        }
        if len(wordsRev[wi]) <= ri {
            return rec(wi+1, ri, rem)
        }
        if d[wordsRev[wi][ri]] != -1 {
            return rec(wi+1, ri, rem+d[wordsRev[wi][ri]])
        }
        for val := 0; val < 10; val++ {
            if visited[val] && (val != 0 || !zeroes[wordsRev[wi][ri]]) {
                delete(visited, val)
                d[wordsRev[wi][ri]] = val
                ret := rec(wi+1, ri, rem+val)
                d[wordsRev[wi][ri]] = -1
                visited[val] = true
                if ret {
                    return true
                }
            }
        }
        return false
    }
    return rec(0, 0, 0)
}

func reverse(s string) string {
    runes := []byte(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}
