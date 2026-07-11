func expressiveWords(s string, words []string) int {
    encode := func(x string) ([]byte, []int) {
        chars := []byte{}
        cnts := []int{}
        var prev byte
        c := 0
        for i := 0; i < len(x); i++ {
            ch := x[i]
            if ch == prev {
                c++
            } else {
                if prev != 0 {
                    chars = append(chars, prev)
                    cnts = append(cnts, c)
                }
                prev = ch
                c = 1
            }
        }
        if prev != 0 {
            chars = append(chars, prev)
            cnts = append(cnts, c)
        }
        return chars, cnts
    }
    
    sChars, sCnts := encode(s)
    ans := 0
    for _, w := range words {
        wChars, wCnts := encode(w)
        if string(sChars) != string(wChars) {
            continue
        }
        ok := true
        for i := 0; i < len(sCnts); i++ {
            sc, wc := sCnts[i], wCnts[i]
            if sc < wc || (sc < 3 && sc != wc) {
                ok = false
                break
            }
        }
        if ok {
            ans++
        }
    }
    return ans
}
