class Solution {
    func minSteps(_ n: Int) -> Int {
        if n == 1 { return 0 }
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 2...n {
            dp[i] = i
            for j in stride(from: i - 1, through: 1, by: -1) {
                if i % j == 0 {
                    dp[i] = dp[j] + (i / j)
                    break
                }
            }
        }
        return dp[n]
    }
}
