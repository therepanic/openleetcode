class Solution {
    func myAtoi(_ s: String) -> Int {
        let chars = Array(s)
        var i = 0
        while i < chars.count && chars[i] == " " {
            i += 1
        }
        if i == chars.count {
            return 0
        }

        var sign = 1
        if chars[i] == "-" {
            sign = -1
            i += 1
        } else if chars[i] == "+" {
            i += 1
        }

        var res: Int64 = 0
        while i < chars.count, let digit = chars[i].wholeNumberValue {
            if sign == 1 {
                if res > Int64(Int32.max) / 10 || (res == Int64(Int32.max) / 10 && digit > 7) {
                    return 2147483647
                }
            } else {
                if res > 2147483648 / 10 || (res == 2147483648 / 10 && digit > 8) {
                    return -2147483648
                }
            }
            res = res * 10 + Int64(digit)
            i += 1
        }

        let value = sign == 1 ? res : -res
        return Int(value)
    }
}
