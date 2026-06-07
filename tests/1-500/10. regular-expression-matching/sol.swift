class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s)
        let p = Array(p)
        let m = s.count
        let n = p.count
        let star: Character = "*"
        let dot: Character = "."
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        if n >= 2 {
            for j in 1...n {
                if j >= 2 && p[j - 1] == star { dp[0][j] = dp[0][j - 2] }
            }
        }
        if m > 0 && n > 0 {
            for i in 1...m {
                for j in 1...n {
                    if p[j - 1] == s[i - 1] || p[j - 1] == dot {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else if j >= 2 && p[j - 1] == star {
                        dp[i][j] = dp[i][j - 2]
                        if p[j - 2] == s[i - 1] || p[j - 2] == dot {
                            dp[i][j] = dp[i][j] || dp[i - 1][j]
                        }
                    }
                }
            }
        }
        return dp[m][n]
    }
}
