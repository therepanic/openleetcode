class Solution {
    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        if k == 0 { return 1.0 }
        
        let moves = [(1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2)]
        
        var dp = Array(repeating: Array(repeating: 0.0, count: n), count: n)
        dp[row][column] = 1.0
        
        for _ in 0..<k {
            var nextDp = Array(repeating: Array(repeating: 0.0, count: n), count: n)
            for r in 0..<n {
                for c in 0..<n {
                    if dp[r][c] == 0.0 { continue }
                    for (dr, dc) in moves {
                        let nr = r + dr
                        let nc = c + dc
                        if nr >= 0 && nr < n && nc >= 0 && nc < n {
                            nextDp[nr][nc] += dp[r][c] / 8.0
                        }
                    }
                }
            }
            dp = nextDp
        }
        
        var total = 0.0
        for r in 0..<n {
            for c in 0..<n {
                total += dp[r][c]
            }
        }
        return total
    }
}
