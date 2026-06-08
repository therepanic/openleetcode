class Solution {
    func isNumber(_ s: String) -> Bool {
        let chars = Array(s)
        var seenDigit = false
        var seenDot = false
        var seenExp = false
        var seenDigitAfterExp = true

        for i in 0..<chars.count {
            let c = chars[i]
            if c.wholeNumberValue != nil {
                seenDigit = true
                seenDigitAfterExp = true
            } else if c == Character(".") {
                if seenDot || seenExp {
                    return false
                }
                seenDot = true
            } else if c == Character("e") || c == Character("E") {
                if seenExp || !seenDigit {
                    return false
                }
                seenExp = true
                seenDigitAfterExp = false
            } else if c == Character("+") || c == Character("-") {
                if i > 0 && chars[i - 1] != Character("e") && chars[i - 1] != Character("E") {
                    return false
                }
            } else {
                return false
            }
        }

        return seenDigit && seenDigitAfterExp
    }
}
