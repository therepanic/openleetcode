class Solution {
    func maxValue(_ n: String, _ x: Int) -> String {
        let xs = String(x)
        let chars = Array(n)
        if chars[0] != "-" {
            for i in 0..<chars.count {
                if xs > String(chars[i]) {
                    return String(chars[0..<i]) + xs + String(chars[i..<chars.count])
                }
            }
            return n + xs
        } else {
            for i in 1..<chars.count {
                if xs < String(chars[i]) {
                    return String(chars[0..<i]) + xs + String(chars[i..<chars.count])
                }
            }
            return n + xs
        }
    }
}
