class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n)
        if m > 1 {
            for _ in 1..<m {
                for col in 1..<n {
                    dp[col] += dp[col - 1]
                }
            }
        }
        return dp[n - 1]
    }
}
