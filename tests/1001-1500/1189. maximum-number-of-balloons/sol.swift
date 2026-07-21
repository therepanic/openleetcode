class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var f: [Character: Int] = [:]
        for c in text {
            f[c, default: 0] += 1
        }
        return min(f["b"] ?? 0, f["a"] ?? 0, (f["l"] ?? 0) / 2, (f["o"] ?? 0) / 2, f["n"] ?? 0)
    }
}
