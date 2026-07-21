class Solution {
    private let MOD = 1000000007
    
    func findGoodStrings(_ n: Int, _ s1: String, _ s2: String, _ evil: String) -> Int {
        let m = evil.count
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        let evilArr = Array(evil)
        
        var lps = [Int](repeating: 0, count: m)
        for i in 1..<m {
            var j = lps[i - 1]
            while j > 0 && evilArr[i] != evilArr[j] {
                j = lps[j - 1]
            }
            if evilArr[i] == evilArr[j] {
                lps[i] = j + 1
            }
        }
        
        func getNextState(_ currMatch: Int, _ c: Character) -> Int {
            var curr = currMatch
            while curr > 0 && c != evilArr[curr] {
                curr = lps[curr - 1]
            }
            if c == evilArr[curr] {
                curr += 1
            }
            return curr
        }
        
        var memo = Array(repeating: Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: 2), count: m + 1), count: n + 1)
        
        func dp(_ idx: Int, _ eIdx: Int, _ tightLo: Int, _ tightHi: Int) -> Int {
            if eIdx == m { return 0 }
            if idx == n { return 1 }
            
            if memo[idx][eIdx][tightLo][tightHi] != -1 {
                return memo[idx][eIdx][tightLo][tightHi]
            }
            
            var res = 0
            let lower = tightLo == 1 ? s1Arr[idx] : Character("a")
            let upper = tightHi == 1 ? s2Arr[idx] : Character("z")
            
            var c = lower
            while c <= upper {
                let nextEIdx = getNextState(eIdx, c)
                let nextTightLo = (tightLo == 1 && c == lower) ? 1 : 0
                let nextTightHi = (tightHi == 1 && c == upper) ? 1 : 0
                
                res = (res + dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD
                
                c = Character(UnicodeScalar(c.asciiValue! + 1))
            }
            
            memo[idx][eIdx][tightLo][tightHi] = res
            return res
        }
        
        return dp(0, 0, 1, 1)
    }
}
