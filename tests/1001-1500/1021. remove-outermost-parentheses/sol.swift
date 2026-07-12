class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var res = ""
        var balance = 0
        var start = s.startIndex
        for (i, ch) in s.enumerated() {
            if ch == "(" {
                balance += 1
            } else {
                balance -= 1
            }
            if balance == 0 {
                let startIdx = s.index(start, offsetBy: 1)
                let endIdx = s.index(s.startIndex, offsetBy: i)
                res += s[startIdx..<endIdx]
                start = s.index(s.startIndex, offsetBy: i + 1)
            }
        }
        return res
    }
}
