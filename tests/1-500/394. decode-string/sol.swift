class Solution {
    private var i = 0
    
    func decodeString(_ s: String) -> String {
        return decode(Array(s))
    }
    
    private func decode(_ chars: [Character]) -> String {
        var res = ""
        var num = 0
        while i < chars.count {
            let c = chars[i]
            if c.isNumber {
                num = num * 10 + Int(String(c))!
                i += 1
            } else if c == "[" {
                i += 1
                let inner = decode(chars)
                for _ in 0..<num {
                    res += inner
                }
                num = 0
            } else if c == "]" {
                i += 1
                return res
            } else {
                res += String(c)
                i += 1
            }
        }
        return res
    }
}
