class Solution {
    func reformat(_ s: String) -> String {
        var digits = [Character]()
        var letters = [Character]()
        for c in s {
            if c.isNumber {
                digits.append(c)
            } else if c.isLetter {
                letters.append(c)
            }
        }
        if abs(digits.count - letters.count) >= 2 {
            return ""
        }
        var ans = [Character](repeating: " ", count: s.count)
        if digits.count > letters.count {
            for i in 0..<s.count {
                if i % 2 == 0 {
                    ans[i] = digits[i / 2]
                } else {
                    ans[i] = letters[i / 2]
                }
            }
        } else {
            for i in 0..<s.count {
                if i % 2 == 0 {
                    ans[i] = letters[i / 2]
                } else {
                    ans[i] = digits[i / 2]
                }
            }
        }
        return String(ans)
    }
}
