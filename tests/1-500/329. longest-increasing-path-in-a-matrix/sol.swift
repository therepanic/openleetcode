class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let row = matrix.count
        let col = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: col), count: row)
        
        func graph(_ i: Int, _ j: Int) -> Int {
            if dp[i][j] != 0 {
                return dp[i][j]
            }
            
            var top = 0
            var down = 0
            var left = 0
            var right = 0
            
            if i - 1 >= 0 && matrix[i-1][j] > matrix[i][j] {
                if dp[i-1][j] == 0 {
                    dp[i-1][j] = graph(i-1, j)
                }
                top = dp[i-1][j]
            }
            
            if i + 1 < row && matrix[i+1][j] > matrix[i][j] {
                if dp[i+1][j] == 0 {
                    dp[i+1][j] = graph(i+1, j)
                }
                down = dp[i+1][j]
            }
            
            if j - 1 >= 0 && matrix[i][j-1] > matrix[i][j] {
                if dp[i][j-1] == 0 {
                    dp[i][j-1] = graph(i, j-1)
                }
                left = dp[i][j-1]
            }
            
            if j + 1 < col && matrix[i][j+1] > matrix[i][j] {
                if dp[i][j+1] == 0 {
                    dp[i][j+1] = graph(i, j+1)
                }
                right = dp[i][j+1]
            }
            
            dp[i][j] = 1 + max(top, max(down, max(left, right)))
            return dp[i][j]
        }
        
        var maxi = 0
        for i in 0..<row {
            for j in 0..<col {
                let num = graph(i, j)
                maxi = max(maxi, num)
            }
        }
        
        return maxi
    }
}
