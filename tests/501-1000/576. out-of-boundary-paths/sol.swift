class Solution {
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        if maxMove == 0 {
            return 0
        }
        let MOD = 1000000007
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n), count: m), count: maxMove + 1)
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        for move in 1...maxMove {
            for i in 0..<m {
                for j in 0..<n {
                    for (dx, dy) in directions {
                        let x = i + dx
                        let y = j + dy
                        if x < 0 || x >= m || y < 0 || y >= n {
                            dp[move][i][j] = (dp[move][i][j] + 1) % MOD
                        } else {
                            dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD
                        }
                    }
                }
            }
        }

        return dp[maxMove][startRow][startColumn]
    }
}
