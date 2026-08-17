class Solution {
    func minDeletions(_ s: String) -> Int {
        var count = Array(repeating: 0, count: 26)
        for ch in s.utf8 {
            count[Int(ch) - 97] += 1
        }
        var freqs = count.filter { $0 > 0 }.sorted(by: >)
        var deletes = 0
        for idx in 1..<freqs.count {
            if freqs[idx] >= freqs[idx - 1] {
                let target = max(0, freqs[idx - 1] - 1)
                deletes += (freqs[idx] - target)
                freqs[idx] = target
            }
        }
        return deletes
    }
}
