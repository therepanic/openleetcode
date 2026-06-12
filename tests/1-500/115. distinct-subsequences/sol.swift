
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let sChars = Array(s)
        let tChars = Array(t)
        if tChars.isEmpty { return 1 }
        if sChars.count < tChars.count { return 0 }

        var dp = Array(repeating: Int64(0), count: tChars.count + 1)
        let cap = Int64.max / 4
        dp[0] = 1
        for ch in sChars {
            var j = tChars.count - 1
            while j >= 0 {
                if ch == tChars[j] {
                    if dp[j + 1] > cap - dp[j] {
                        dp[j + 1] = cap
                    } else {
                        dp[j + 1] += dp[j]
                    }
                }
                if j == 0 {
                    break
                }
                j -= 1
            }
        }
        return Int(dp[tChars.count])
    }
}
