class Solution {
    func thousandSeparator(_ n: Int) -> String {
        let s = String(n)
        if s.count <= 3 { return s }
        var result = ""
        var count = 0
        for ch in s.reversed() {
            result.append(ch)
            count += 1
            if count % 3 == 0 && count < s.count {
                result.append(".")
            }
        }
        return String(result.reversed())
    }
}
