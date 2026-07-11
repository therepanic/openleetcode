class Solution {
    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        let MOD = 1000000007
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 2)
        dp[0][0] = 1

        for i in 1...goal {
            dp[i % 2][0] = 0
            let limit = min(i, n)
            for j in 1...limit {
                dp[i % 2][j] = dp[(i - 1) % 2][j - 1] * (n - (j - 1)) % MOD
                if j > k {
                    dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k)) % MOD
                }
            }
        }

        return dp[goal % 2][n]
    }
}
