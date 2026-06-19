class Solution {
    func findSubstringInWraproundString(_ s: String) -> Int {
        var counts = [Int](repeating: 0, count: 26)
        var maxLen = 0
        let chars = Array(s)

        for i in 0..<chars.count {
            if i > 0 && (Int(chars[i].asciiValue!) - Int(chars[i-1].asciiValue!) + 26) % 26 == 1 {
                maxLen += 1
            } else {
                maxLen = 1
            }
            let idx = Int(chars[i].asciiValue! - Character("a").asciiValue!)
            counts[idx] = max(counts[idx], maxLen)
        }

        return counts.reduce(0, +)
    }
}
