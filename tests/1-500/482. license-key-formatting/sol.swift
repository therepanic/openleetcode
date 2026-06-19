class Solution {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        let s = s.replacingOccurrences(of: "-", with: "").uppercased()
        var result: [String] = []
        var i = s.count
        while i > 0 {
            let start = max(0, i - k)
            let startIndex = s.index(s.startIndex, offsetBy: start)
            let endIndex = s.index(s.startIndex, offsetBy: i)
            result.insert(String(s[startIndex..<endIndex]), at: 0)
            i -= k
        }
        return result.joined(separator: "-")
    }
}
