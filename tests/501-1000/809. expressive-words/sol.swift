class Solution {
    func expressiveWords(_ s: String, _ words: [String]) -> Int {
        func encode(_ x: String) -> ([Character], [Int]) {
            var chars = [Character]()
            var cnts = [Int]()
            var prev: Character? = nil
            var c = 0
            for ch in x {
                if ch == prev {
                    c += 1
                } else {
                    if let p = prev {
                        chars.append(p)
                        cnts.append(c)
                    }
                    prev = ch
                    c = 1
                }
            }
            if let p = prev {
                chars.append(p)
                cnts.append(c)
            }
            return (chars, cnts)
        }
        
        let (sChars, sCnts) = encode(s)
        var ans = 0
        for w in words {
            let (wChars, wCnts) = encode(w)
            if sChars != wChars { continue }
            var ok = true
            for i in 0..<sCnts.count {
                let sc = sCnts[i], wc = wCnts[i]
                if sc < wc || (sc < 3 && sc != wc) {
                    ok = false
                    break
                }
            }
            if ok { ans += 1 }
        }
        return ans
    }
}
