class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var t = [Character]()
        var p = 0
        for c in s {
            if c == "(" {
                p += 1
            } else if c == ")" {
                p -= 1
            }
            if p >= 0 {
                t.append(c)
            } else {
                p = 0
            }
        }
        p = 0
        var result = [Character]()
        for c in t.reversed() {
            if c == "(" {
                p += 1
            } else if c == ")" {
                p -= 1
            }
            if p <= 0 {
                result.append(c)
            } else {
                p = 0
            }
        }
        return String(result.reversed())
    }
}
