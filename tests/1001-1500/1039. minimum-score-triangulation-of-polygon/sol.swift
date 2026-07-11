class Solution {
    func minScoreTriangulation(_ values: [Int]) -> Int {
        let n = values.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in i+1..<n {
                var minVal = Int.max
                for k in i+1..<j {
                    let val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j]
                    if val < minVal {
                        minVal = val
                    }
                }
                if minVal != Int.max {
                    dp[i][j] = minVal
                }
            }
        }
        return dp[0][n - 1]
    }
}
