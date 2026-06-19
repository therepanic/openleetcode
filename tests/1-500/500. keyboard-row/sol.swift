class Solution {
    func findWords(_ words: [String]) -> [String] {
        var m: [Character: Int] = [:]
        for c in "qwertyuiop" { m[c] = 1 }
        for c in "asdfghjkl" { m[c] = 2 }
        for c in "zxcvbnm" { m[c] = 3 }
        var ans: [String] = []
        for w in words {
            let lw = w.lowercased()
            let r = m[lw.first!]!
            if lw.allSatisfy({ m[$0] == r }) {
                ans.append(w)
            }
        }
        return ans
    }
}
