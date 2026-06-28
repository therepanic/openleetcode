class Solution {
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let n = grid.count
        
        var dp = Array(repeating: Array(repeating: Int.min, count: n), count: n)
        dp[0][0] = 0
        
        for k in 0...(2 * (n - 1)) {
            var newDp = Array(repeating: Array(repeating: Int.min, count: n), count: n)
            
            for x1 in 0..<n {
                let y1 = k - x1
                if !(y1 >= 0 && y1 < n) { continue }
                
                for x2 in 0..<n {
                    let y2 = k - x2
                    if !(y2 >= 0 && y2 < n) { continue }
                    
                    if grid[x1][y1] == -1 || grid[x2][y2] == -1 { continue }
                    
                    var best = dp[x1][x2]
                    if x1 > 0 { best = max(best, dp[x1-1][x2]) }
                    if x2 > 0 { best = max(best, dp[x1][x2-1]) }
                    if x1 > 0 && x2 > 0 { best = max(best, dp[x1-1][x2-1]) }
                    
                    if best == Int.min { continue }
                    
                    best += grid[x1][y1]
                    if x1 != x2 { best += grid[x2][y2] }
                    
                    newDp[x1][x2] = best
                }
            }
            
            dp = newDp
        }
        
        return max(0, dp[n-1][n-1])
    }
}
