class Solution {
    func ways(_ pizza: [String], _ k: Int) -> Int {
        let m = pizza.count, n = pizza[0].count, MOD = 1_000_000_007
        var preSum = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        let chars = pizza.map { Array($0) }

        for r in stride(from: m - 1, through: 0, by: -1) {
            for c in stride(from: n - 1, through: 0, by: -1) {
                preSum[r][c] = preSum[r][c + 1] + preSum[r + 1][c] - preSum[r + 1][c + 1] + (chars[r][c] == "A" ? 1 : 0)
            }
        }

        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n), count: m), count: k)

        for r in 0..<m {
            for c in 0..<n {
                dp[0][r][c] = preSum[r][c] > 0 ? 1 : 0
            }
        }

        for cuts in 1..<k {
            for r in 0..<m {
                for c in 0..<n {
                    guard preSum[r][c] > 0 else { continue }
                    var ans = 0
                    for nr in r + 1..<m {
                        if preSum[r][c] - preSum[nr][c] > 0 {
                            ans = (ans + dp[cuts - 1][nr][c]) % MOD
                        }
                    }
                    for nc in c + 1..<n {
                        if preSum[r][c] - preSum[r][nc] > 0 {
                            ans = (ans + dp[cuts - 1][r][nc]) % MOD
                        }
                    }
                    dp[cuts][r][c] = ans
                }
            }
        }

        return dp[k - 1][0][0]
    }
}
