class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        if n >= 2 {
            for nodes in 2...n {
                for root in 1...nodes {
                    dp[nodes] += dp[root - 1] * dp[nodes - root]
                }
            }
        }

        return dp[n]
    }
}
