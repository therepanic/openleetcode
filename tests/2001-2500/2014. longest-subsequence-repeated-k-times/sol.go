func longestSubsequenceRepeatedK(s string, k int) string {
    isK := func(sub string, t string) bool {
        count := 0
        i := 0
        for _, ch := range t {
            if i < len(sub) && byte(ch) == sub[i] {
                i++
                if i == len(sub) {
                    i = 0
                    count++
                    if count == k {
                        return true
                    }
                }
            }
        }
        return false
    }

    res := ""
    q := []string{""}
    for len(q) > 0 {
        curr := q[0]
        q = q[1:]
        for ch := 'a'; ch <= 'z'; ch++ {
            nxt := curr + string(ch)
            if isK(nxt, s) {
                res = nxt
                q = append(q, nxt)
            }
        }
    }
    return res
}
