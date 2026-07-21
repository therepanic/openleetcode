class Solution {
    func freqAlphabets(_ s: String) -> String {
        var decoded = ""
        var index = s.startIndex
        while index < s.endIndex {
            let third = s.index(index, offsetBy: 2, limitedBy: s.index(before: s.endIndex))
            if let third = third, s[third] == "#" {
                let numStr = s[index..<third]
                let num = Int(numStr)!
                decoded.append(Character(UnicodeScalar(Int(("a" as UnicodeScalar).value) + num - 1)!))
                index = s.index(after: third)
            } else {
                let num = Int(String(s[index]))!
                decoded.append(Character(UnicodeScalar(Int(("a" as UnicodeScalar).value) + num - 1)!))
                index = s.index(after: index)
            }
        }
        return decoded
    }
}
