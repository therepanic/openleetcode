class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let n = s1.count, m = s2.count
        let s1Arr = Array(s1), s2Arr = Array(s2)
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for i in 0..<n {
            for j in 0..<m {
                if s1Arr[i] == s2Arr[j] {
                    dp[i + 1][j + 1] = dp[i][j] + Int(s1Arr[i].asciiValue!)
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }
        let totalAscii = s1Arr.reduce(0) { $0 + Int($1.asciiValue!) } + s2Arr.reduce(0) { $0 + Int($1.asciiValue!) }
        return totalAscii - 2 * dp[n][m]
    }
}
