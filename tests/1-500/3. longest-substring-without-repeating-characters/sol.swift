class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var lastSeen: [Character: Int] = [:]
        var start = 0
        var res = 0
        for (end, c) in chars.enumerated() {
            if let prev = lastSeen[c], prev >= start {
                start = prev + 1
            }
            res = max(res, end - start + 1)
            lastSeen[c] = end
        }
        return res
    }
}
