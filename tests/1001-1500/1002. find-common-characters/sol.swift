class Solution {
    func commonChars(_ words: [String]) -> [String] {
        var freq: [Character: Int] = [:]
        for c in words[0] {
            freq[c, default: 0] += 1
        }
        for i in 1..<words.count {
            var f: [Character: Int] = [:]
            for c in words[i] {
                f[c, default: 0] += 1
            }
            for c in freq.keys {
                if let count = f[c] {
                    freq[c] = min(count, freq[c]!)
                } else {
                    freq[c] = 0
                }
            }
        }
        var res: [String] = []
        for (c, count) in freq {
            for _ in 0..<count {
                res.append(String(c))
            }
        }
        return res
    }
}
