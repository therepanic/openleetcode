class Solution {
    func maximalSquare(_ matrix: [[String]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty {
            return 0
        }
        let Rows = matrix.count
        let Cols = matrix[0].count
        var maxArea = 0
        var dp = Array(repeating: Array(repeating: 0, count: Cols), count: Rows)

        for r in stride(from: Rows - 1, through: 0, by: -1) {
            for c in stride(from: Cols - 1, through: 0, by: -1) {
                if matrix[r][c] == "1" {
                    let down = (r + 1 < Rows) ? dp[r + 1][c] : 0
                    let right = (c + 1 < Cols) ? dp[r][c + 1] : 0
                    let diag = (r + 1 < Rows && c + 1 < Cols) ? dp[r + 1][c + 1] : 0
                    dp[r][c] = 1 + min(down, right, diag)
                } else {
                    dp[r][c] = 0
                }
                maxArea = max(maxArea, dp[r][c])
            }
        }
        return maxArea * maxArea
    }
}
