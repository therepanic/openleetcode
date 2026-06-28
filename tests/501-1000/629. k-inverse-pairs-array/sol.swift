class Solution {
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        let MOD = 1000000007
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

        for i in 1...n {
            for j in 0...k {
                if j == 0 {
                    dp[i][j] = 1
                } else {
                    var val = dp[i - 1][j]
                    if j - i >= 0 {
                        val = (val - dp[i - 1][j - i] + MOD) % MOD
                    }
                    dp[i][j] = (dp[i][j - 1] + val) % MOD
                }
            }
        }

        var result = dp[n][k]
        if k > 0 {
            result = (result - dp[n][k - 1] + MOD) % MOD
        }
        return result
    }
}
