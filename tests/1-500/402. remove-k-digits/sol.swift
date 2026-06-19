class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var s = [Character]()
        var remaining = k
        for c in num {
            while remaining > 0 && !s.isEmpty && s.last! > c {
                s.removeLast()
                remaining -= 1
            }
            s.append(c)
        }
        
        s = Array(s.prefix(s.count - remaining))
        let result = String(s).replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
        return result.isEmpty ? "0" : result
    }
}
