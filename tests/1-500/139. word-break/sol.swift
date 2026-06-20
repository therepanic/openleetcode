class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let words = Set(wordDict)
        let maxLen = wordDict.map(\.count).max() ?? 0
        let chars = Array(s)
        var dp = Array(repeating: false, count: chars.count + 1)
        dp[chars.count] = true
        if chars.isEmpty { return true }
        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            for len in 1...maxLen {
                if i + len > chars.count { break }
                if words.contains(String(chars[i..<(i + len)])) && dp[i + len] { dp[i] = true; break }
            }
        }
        return dp[0]
    }
}
