class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sp = s.startIndex
        var tp = t.startIndex
        while sp < s.endIndex && tp < t.endIndex {
            if s[sp] == t[tp] {
                sp = s.index(after: sp)
            }
            tp = t.index(after: tp)
        }
        return sp == s.endIndex
    }
}
