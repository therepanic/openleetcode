class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        let sorted = strs.sorted { $0.count > $1.count }

        func isSubsequence(_ s: String, _ t: String) -> Bool {
            var i = s.startIndex
            for c in t {
                if i < s.endIndex && s[i] == c {
                    i = s.index(after: i)
                }
            }
            return i == s.endIndex
        }

        for i in 0..<sorted.count {
            var unique = true
            for j in 0..<sorted.count {
                if i == j { continue }
                if isSubsequence(sorted[i], sorted[j]) {
                    unique = false
                    break
                }
            }
            if unique { return sorted[i].count }
        }

        return -1
    }
}
