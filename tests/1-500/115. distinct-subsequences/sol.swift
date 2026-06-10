
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let sChars = Array(s)
        let tChars = Array(t)
        var dp = Array(repeating: 0, count: tChars.count + 1)
        dp[0] = 1
        if tChars.isEmpty { return 1 }
        for ch in sChars {
            if tChars.isEmpty { break }
            for j in stride(from: tChars.count - 1, through: 0, by: -1) {
                if ch == tChars[j] {
                    dp[j + 1] += dp[j]
                }
            }
        }
        return dp[tChars.count]
    }
}
