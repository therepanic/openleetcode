class Solution {
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: n), count: n), count: m)
        dp[0][0][n-1] = grid[0][0] + grid[0][n-1]

        for i in 1..<m {
            for j in 0..<n {
                for k in j+1..<n {
                    for x in -1...1 {
                        for y in -1...1 {
                            let nj = j + x
                            let nk = k + y
                            if nj >= 0 && nj < n && nk >= 0 && nk < n {
                                let prev = dp[i-1][nj][nk]
                                if prev != -1 {
                                    var add = grid[i][j]
                                    if j != k { add += grid[i][k] }
                                    dp[i][j][k] = max(dp[i][j][k], prev + add)
                                }
                            }
                        }
                    }
                }
            }
        }

        var ans = -1
        for row in dp[m-1] {
            for v in row {
                ans = max(ans, v)
            }
        }
        return ans != -1 ? ans : 0
    }
}
