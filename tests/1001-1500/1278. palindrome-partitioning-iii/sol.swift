class Solution {
    func palindromePartition(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let chars = Array(s)
        var c = Array(repeating: Array(repeating: 0, count: n), count: n)
        if n >= 2 {
            for l in 2...n {
                for i in 0...(n - l) {
                    let j = i + l - 1
                    c[i][j] = (l > 2 ? c[i + 1][j - 1] : 0) + (chars[i] != chars[j] ? 1 : 0)
                }
            }
        }
        var dp = Array(repeating: Array(repeating: Int.max / 2, count: n + 1), count: k + 1)
        dp[0][0] = 0
        for i in 1...n {
            dp[1][i] = c[0][i - 1]
        }
        if k >= 2 {
            for p in 2...k {
                for i in p...n {
                    var mn = Int.max / 2
                    for t in (p - 1)..<i {
                        mn = min(mn, dp[p - 1][t] + c[t][i - 1])
                    }
                    dp[p][i] = mn
                }
            }
        }
        return dp[k][n]
    }
}
