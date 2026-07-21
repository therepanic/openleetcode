class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        let MOD = 1000000007
        let maxPos = min(steps / 2, arrLen - 1)
        var dp = [Int](repeating: 0, count: maxPos + 1)
        dp[0] = 1
        for _ in 0..<steps {
            var newDp = [Int](repeating: 0, count: maxPos + 1)
            for pos in 0...maxPos {
                if dp[pos] == 0 { continue }
                newDp[pos] = (newDp[pos] + dp[pos]) % MOD
                if pos > 0 { newDp[pos - 1] = (newDp[pos - 1] + dp[pos]) % MOD }
                if pos < maxPos { newDp[pos + 1] = (newDp[pos + 1] + dp[pos]) % MOD }
            }
            dp = newDp
        }
        return dp[0]
    }
}
