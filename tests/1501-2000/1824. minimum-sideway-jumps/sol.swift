class Solution {
    func minSideJumps(_ obstacles: [Int]) -> Int {
        let INF = Int.max / 2
        var dp = [1, 0, 1]
        for i in 1..<obstacles.count {
            let obs = obstacles[i]
            for j in 0..<3 {
                if obs == j + 1 { dp[j] = INF }
            }
            for j in 0..<3 {
                if obs != j + 1 {
                    dp[j] = min(dp[j], min(dp[(j + 1) % 3], dp[(j + 2) % 3]) + 1)
                }
            }
        }
        return dp.min()!
    }
}
