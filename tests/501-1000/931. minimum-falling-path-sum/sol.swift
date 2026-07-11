class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var dp = matrix[0]
        for i in 1..<m {
            var ndp = [Int](repeating: 0, count: n)
            for j in 0..<n {
                var best = dp[j]
                if j > 0 { best = min(best, dp[j - 1]) }
                if j + 1 < n { best = min(best, dp[j + 1]) }
                ndp[j] = matrix[i][j] + best
            }
            dp = ndp
        }
        return dp.min()!
    }
}
