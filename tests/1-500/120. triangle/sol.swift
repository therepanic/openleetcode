
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle[triangle.count - 1]
        if triangle.count == 1 { return dp[0] }
        for row in stride(from: triangle.count - 2, through: 0, by: -1) {
            for col in 0..<triangle[row].count {
                dp[col] = triangle[row][col] + min(dp[col], dp[col + 1])
            }
        }
        return dp[0]
    }
}
