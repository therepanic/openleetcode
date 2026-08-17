class Solution {
    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        let mod = 1000000007
        var total = 1
        for _ in 0..<m {
            total *= 3
        }
        var dp = Array(repeating: Array(repeating: 0, count: total), count: n+1)
        var rowValid = Array(repeating: Array(repeating: 0, count: total), count: total)
        var good: [Int] = []
        var pattern = Array(repeating: Array(repeating: 0, count: m), count: total)
        for i in 0..<total {
            var val = i
            var valid = 1
            for k in 0..<m {
                pattern[i][k] = val % 3
                val /= 3
            }
            for k in 1..<m {
                if pattern[i][k] == pattern[i][k-1] {
                    valid = 0
                }
            }
            if valid == 1 {
                good.append(i)
            }
        }
        for i in good {
            dp[1][i] = 1
        }
        for i in good {
            for j in good {
                rowValid[i][j] = 1
                for k in 0..<m {
                    if pattern[i][k] == pattern[j][k] {
                        rowValid[i][j] = 0
                    }
                }
            }
        }
        if n >= 2 {
            for col in 2...n {
                for i in good {
                    var totalWays = 0
                    for j in good {
                        if rowValid[i][j] == 1 {
                            totalWays += dp[col-1][j]
                        }
                    }
                    dp[col][i] = totalWays % mod
                }
            }
        }
        var ans = 0
        for i in good {
            ans += dp[n][i]
        }
        return ans % mod
    }
}
