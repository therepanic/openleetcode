class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        var balloons = [1] + nums + [1]
        let n = balloons.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for length in 2..<n {
            for left in 0..<n-length {
                let right = left + length
                var best = 0
                for k in (left+1)..<right {
                    let gain = balloons[left] * balloons[k] * balloons[right]
                    let total = gain + dp[left][k] + dp[k][right]
                    if total > best {
                        best = total
                    }
                }
                dp[left][right] = best
            }
        }
        
        return dp[0][n-1]
    }
}
