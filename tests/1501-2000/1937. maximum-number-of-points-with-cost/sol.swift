class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        let m = points.count
        let n = points[0].count
        
        var dp = points[0]
        
        for r in 1..<m {
            var left = [Int](repeating: 0, count: n)
            var right = [Int](repeating: 0, count: n)
            
            left[0] = dp[0]
            for c in 1..<n {
                left[c] = max(left[c-1], dp[c] + c)
            }
            
            right[n-1] = dp[n-1] - (n-1)
            for c in stride(from: n-2, through: 0, by: -1) {
                right[c] = max(right[c+1], dp[c] - c)
            }
            
            var newDp = [Int](repeating: 0, count: n)
            for c in 0..<n {
                let best = max(left[c] - c, right[c] + c)
                newDp[c] = points[r][c] + best
            }
            dp = newDp
        }
        
        return dp.max()!
    }
}
