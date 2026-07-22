class Solution {
    func arrangeWords(_ text: String) -> String {
        var s = text.split(separator: " ").map { String($0) }
        s.sort { $0.count < $1.count }
        s = s.map { $0.lowercased() }
        if !s.isEmpty {
            s[0] = s[0].prefix(1).uppercased() + s[0].dropFirst()
        }
        return s.joined(separator: " ")
    }
}
