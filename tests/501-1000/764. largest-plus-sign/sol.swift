class Solution {
    func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
        var s = Set<Int>()
        for mine in mines {
            s.insert(mine[0] * n + mine[1])
        }
        var dp = Array(repeating: Array(repeating: n, count: n), count: n)
        
        for i in 0..<n {
            var count = 0
            for j in 0..<n {
                count = s.contains(i * n + j) ? 0 : count + 1
                dp[i][j] = min(dp[i][j], count)
            }
            count = 0
            for j in stride(from: n - 1, through: 0, by: -1) {
                count = s.contains(i * n + j) ? 0 : count + 1
                dp[i][j] = min(dp[i][j], count)
            }
        }
        
        for j in 0..<n {
            var count = 0
            for i in 0..<n {
                count = s.contains(i * n + j) ? 0 : count + 1
                dp[i][j] = min(dp[i][j], count)
            }
            count = 0
            for i in stride(from: n - 1, through: 0, by: -1) {
                count = s.contains(i * n + j) ? 0 : count + 1
                dp[i][j] = min(dp[i][j], count)
            }
        }
        
        return dp.flatMap { $0 }.max() ?? 0
    }
}
