class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let s1 = Array(str1), s2 = Array(str2)
        let m = s1.count, n = s2.count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for i in 1...m {
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        var i = m, j = n
        var result = [Character]()
        
        while i > 0 && j > 0 {
            if s1[i-1] == s2[j-1] {
                result.append(s1[i-1])
                i -= 1
                j -= 1
            } else if dp[i-1][j] > dp[i][j-1] {
                result.append(s1[i-1])
                i -= 1
            } else {
                result.append(s2[j-1])
                j -= 1
            }
        }
        
        while i > 0 {
            result.append(s1[i-1])
            i -= 1
        }
        
        while j > 0 {
            result.append(s2[j-1])
            j -= 1
        }
        
        return String(result.reversed())
    }
}
