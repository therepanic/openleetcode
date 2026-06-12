class Solution {
    func minCut(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var isPal = Array(repeating: Array(repeating: false, count: n), count: n)
        for end in 0..<n {
            for start in 0...end where chars[start] == chars[end] && (end - start <= 2 || isPal[start + 1][end - 1]) { isPal[start][end] = true }
        }
        var dp = Array(repeating: 0, count: n)
        for i in 0..<n {
            if isPal[0][i] { dp[i] = 0 } else {
                dp[i] = i
                for j in 0..<i where isPal[j + 1][i] { dp[i] = Swift.min(dp[i], dp[j] + 1) }
            }
        }
        return dp[n - 1]
    }
}
