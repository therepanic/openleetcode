class Solution {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var res = 0
        var curr = 0
        var sign = 1

        for c in s {
            if c.isNumber {
                curr = curr * 10 + Int(String(c))!
            } else if c == "+" {
                res += sign * curr
                sign = 1
                curr = 0
            } else if c == "-" {
                res += sign * curr
                sign = -1
                curr = 0
            } else if c == "(" {
                stack.append(res)
                stack.append(sign)
                res = 0
                sign = 1
            } else if c == ")" {
                res += sign * curr
                curr = 0
                res *= stack.removeLast()
                res += stack.removeLast()
            }
        }

        res += sign * curr
        return res
    }
}
