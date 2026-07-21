class Solution {
    func minInsertions(_ s: String) -> Int {
        let n = s.count
        let s2 = String(s.reversed())
        let sArr = Array(s)
        let s2Arr = Array(s2)
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        for i in 1...n {
            for j in 1...n {
                if sArr[i - 1] == s2Arr[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return n - dp[n][n]
    }
}
