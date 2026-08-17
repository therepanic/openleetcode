class Solution {
    func maxProductPath(_ grid: [[Int]]) -> Int {
        let r = grid.count
        let c = grid[0].count
        let MOD = 1_000_000_007
        var dp = Array(repeating: Array(repeating: [0, 0], count: c), count: r)
        
        var p = grid[0][0]
        dp[0][0][0] = p
        dp[0][0][1] = p
        for j in 1..<c {
            p *= grid[0][j]
            dp[0][j][0] = p
            dp[0][j][1] = p
        }
        
        p = grid[0][0]
        for i in 1..<r {
            p *= grid[i][0]
            dp[i][0][0] = p
            dp[i][0][1] = p
            for j in 1..<c {
                let x = grid[i][j]
                let vals = [x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]]
                dp[i][j][0] = vals.min()!
                dp[i][j][1] = vals.max()!
            }
        }
        
        let ans = dp[r-1][c-1][1]
        if ans < 0 { return -1 }
        return ans % MOD
    }
}
