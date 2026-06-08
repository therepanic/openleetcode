class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let a = Array(s1)
        let b = Array(s2)
        let c = Array(s3)
        if a.count + b.count != c.count {
            return false
        }

        var dp = Array(repeating: false, count: b.count + 1)
        dp[0] = true
        if b.count > 0 {
            for j in 1...b.count {
                dp[j] = dp[j - 1] && b[j - 1] == c[j - 1]
            }
        }

        if a.count > 0 {
            for i in 1...a.count {
                dp[0] = dp[0] && a[i - 1] == c[i - 1]
                if b.count > 0 {
                    for j in 1...b.count {
                        dp[j] = (dp[j] && a[i - 1] == c[i + j - 1]) ||
                            (dp[j - 1] && b[j - 1] == c[i + j - 1])
                    }
                }
            }
        }

        return dp[b.count]
    }
}
