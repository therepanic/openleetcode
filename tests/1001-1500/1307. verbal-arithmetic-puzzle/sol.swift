class Solution {
    func isSolvable(_ words: [String], _ result: String) -> Bool {
        var zeroes = Set<Character>()
        var m = 0
        for word in words {
            if word.count > 1 {
                zeroes.insert(word.first!)
            }
            m = max(m, word.count)
        }
        if m > result.count { return false }
        
        var d = [Character: Int]()
        for word in words + [result] {
            for c in word {
                d[c] = -1
            }
        }
        let wordsRev = words.map { String($0.reversed()) }
        let resultRev = String(result.reversed())
        let R = resultRev.count
        let N = wordsRev.count
        var visited: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        func rec(_ wi: Int, _ ri: Int, _ rem: Int) -> Bool {
            if ri == R {
                return rem == 0 && (result.count == 1 || d[resultRev[resultRev.index(resultRev.startIndex, offsetBy: R-1)]] != 0)
            }
            let rChar = resultRev[resultRev.index(resultRev.startIndex, offsetBy: ri)]
            if wi == N {
                if d[rChar] != -1 {
                    if d[rChar] != rem % 10 { return false }
                    return rec(0, ri+1, rem/10)
                } else if visited.contains(rem % 10) {
                    let val = rem % 10
                    visited.remove(val)
                    d[rChar] = val
                    let ret = rec(wi, ri, rem)
                    d[rChar] = -1
                    visited.insert(val)
                    if ret { return true }
                }
                return false
            }
            if wordsRev[wi].count <= ri {
                return rec(wi+1, ri, rem)
            }
            let wChar = wordsRev[wi][wordsRev[wi].index(wordsRev[wi].startIndex, offsetBy: ri)]
            if d[wChar] != -1 {
                return rec(wi+1, ri, rem + d[wChar]!)
            }
            for val in 0...9 {
                if visited.contains(val) && (val != 0 || !zeroes.contains(wChar)) {
                    visited.remove(val)
                    d[wChar] = val
                    let ret = rec(wi+1, ri, rem + val)
                    d[wChar] = -1
                    visited.insert(val)
                    if ret { return true }
                }
            }
            return false
        }
        
        return rec(0, 0, 0)
    }
}
