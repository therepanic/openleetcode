class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        let m = sChars.count
        let n = pChars.count
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true

        if n > 0 {
            for j in 1...n {
                if pChars[j - 1] == "*" {
                    dp[0][j] = dp[0][j - 1]
                }
            }
        }

        if m > 0 && n > 0 {
            for i in 1...m {
                for j in 1...n {
                    if pChars[j - 1] == "?" || pChars[j - 1] == sChars[i - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else if pChars[j - 1] == "*" {
                        dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
                    }
                }
            }
        }

        return dp[m][n]
    }
}
