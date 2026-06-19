class Solution {
    func frequencySort(_ s: String) -> String {
        var freq = [Character: Int]()
        for c in s {
            freq[c, default: 0] += 1
        }
        let sorted = freq.sorted { $0.value > $1.value }
        var result = ""
        for (char, count) in sorted {
            result += String(repeating: char, count: count)
        }
        return result
    }
}
